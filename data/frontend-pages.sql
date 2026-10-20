-- Minimal frontend and OIDC login records used by every development profile.
-- Keep these independent from the optional Solr setup so the default stack has
-- a renderable frontend and a stable place from which to start OIDC login.

INSERT INTO pages (
    uid, pid, tstamp, crdate, deleted, hidden, sorting, perms_userid, perms_groupid,
    perms_user, perms_group, perms_everybody, title, slug, doktype, is_siteroot
)
SELECT
    1, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 0, 0, 128, 1, 0,
    31, 27, 0, 'Presentation', '/', 1, 1
WHERE NOT EXISTS (
    SELECT 1 FROM pages WHERE uid = 1 OR (pid = 0 AND deleted = 0 AND is_siteroot = 1)
);

INSERT INTO sys_template (
    uid, pid, tstamp, crdate, deleted, hidden, sorting, title, root, clear,
    include_static_file, constants, config
)
SELECT
    1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 0, 0, 128, 'Presentation', 1, 1,
    'EXT:fluid_styled_content/Configuration/TypoScript/,EXT:dlf/Configuration/TypoScript/',
    'plugin.tx_dlf.persistence.storagePid = 3\nplugin.tx_dlf.persistence.solrCoreUid = 1',
    'page = PAGE\npage {\n  typeNum = 0\n  10 < styles.content.get\n}\n\nplugin.tx_oidc.mapping.fe_users {\n  username = <sub>\n  name = <name>\n  first_name = <given_name>\n  last_name = <family_name>\n  email = <email>\n}'
WHERE NOT EXISTS (
    SELECT 1 FROM sys_template WHERE uid = 1 OR (pid = 1 AND deleted = 0 AND root = 1)
);

INSERT INTO pages (
    pid, tstamp, crdate, deleted, hidden, sorting, perms_userid, perms_groupid,
    perms_user, perms_group, perms_everybody, title, slug, doktype, nav_hide
)
SELECT
    1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 0, 0, 512, 1, 0,
    31, 27, 0, 'Login', '/login', 1, 1
WHERE NOT EXISTS (
    SELECT 1 FROM pages WHERE pid = 1 AND deleted = 0 AND slug = '/login'
);

SET @oidc_login_pid = (
    SELECT uid FROM pages
    WHERE pid = 1 AND deleted = 0 AND slug = '/login'
    ORDER BY uid
    LIMIT 1
);

INSERT INTO tt_content (
    pid, tstamp, crdate, deleted, hidden, sorting, CType, header, colPos
)
SELECT
    @oidc_login_pid, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 0, 0, 128,
    'oidc_login', 'Keycloak Login', 0
WHERE @oidc_login_pid IS NOT NULL
  AND NOT EXISTS (
      SELECT 1 FROM tt_content
      WHERE pid = @oidc_login_pid AND deleted = 0 AND CType = 'oidc_login'
  );
