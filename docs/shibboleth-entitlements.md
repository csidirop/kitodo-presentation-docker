# Shibboleth entitlement mapping

Use this flow when Shibboleth SSO is connected later:

```text
Shibboleth attribute
→ Keycloak user attribute or role
→ OIDC UserInfo claim
→ TYPO3 frontend group or Kitodo.AccessRights policy
```

Entitlements should be treated as authorization data rather than ordinary
profile fields on `fe_users`.

## Keycloak

1. Import the Shibboleth/SAML entitlement attribute into Keycloak.
2. Normalize it into a multivalued OIDC claim.
3. Include the claim in the OIDC UserInfo response. This is required because
   `causal/oidc` retrieves the user attributes from the UserInfo endpoint.
4. Prefer exposing the normalized values in the top-level `Roles` claim, which
   is the claim shape supported directly by `causal/oidc`.

Example UserInfo response:

```json
{
  "sub": "immutable-user-id",
  "email": "user@example.org",
  "Roles": [
    "urn:example:entitlement:image-reader",
    "urn:example:entitlement:download"
  ]
}
```

The Keycloak protocol mapper for `Roles` must be multivalued and have
**Add to UserInfo** enabled. It may also be added to the ID and access tokens,
but that alone is not sufficient for this TYPO3 integration.

## TYPO3 group mapping

Create a TYPO3 frontend group for each local permission and enter the matching
value in its **OIDC pattern** field (`tx_oidc_pattern`).

Exact match:

```text
urn:example:entitlement:image-reader
```

Alternative values:

```text
urn:example:entitlement:image-reader|urn:example:entitlement:admin
```

Wildcard:

```text
urn:example:entitlement:collection:*
```

On every successful OIDC login, `causal/oidc` recalculates OIDC-managed group
membership. Removing an entitlement at the identity provider therefore removes
the corresponding TYPO3 group on the next login.

Authentication and authorization should remain separate:

- Every authenticated user receives a neutral baseline frontend group.
- Entitlement-derived groups grant access to protected content or actions.
- Kitodo.AccessRights evaluates those authorization groups or their normalized
  entitlement values.

## Custom claim structures

If the provider must expose a separate claim instead of `Roles`, for example:

```json
{
  "entitlements": ["value-a", "value-b"]
}
```

do not map it directly through ordinary TypoScript. For array claims,
`causal/oidc`'s simple field mapper keeps only the first value. Implement an
event listener in `kitodo/accessrights` using the appropriate extension event:

- `AuthenticationGetUserGroupsEvent` maps entitlement values to TYPO3 groups.
- `AuthenticationProcessMappingEvent` transforms or serializes values into
  custom database fields.
- `ModifyResourceOwnerEvent` flattens or renames claims before normal mapping.

Persist only the attributes required by the application. Do not store complete
SAML assertions, raw ID tokens, access tokens, or refresh tokens in `fe_users`.
