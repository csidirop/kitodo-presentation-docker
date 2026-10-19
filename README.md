# Kitodo.Presentation docker
Docker configuration for [Kitodo.Presentation](https://github.com/kitodo/kitodo-presentation).

## Kitodo.Presentation
Kitodo.Presentation is a feature-rich framework for building a METS or IIIF based digital library. It is part of the Kitodo Digital Library Suite.

More Information about Kitodo.Presentation can be found on the [official Git repository](https://github.com/kitodo/kitodo-presentation).

## Kitodo. Digital Library Modules
[Kitodo](https://github.com/kitodo) is an open source software suite intended to support mass digitization projects for cultural heritage institutions. Kitodo is widely used and cooperatively maintained by major German libraries and digitization service providers. The software implements international standards such as METS, MODS, ALTO, and other formats maintained by the Library of Congress. Kitodo consists of several independent modules serving different purposes such as controlling the digitization workflow, enriching descriptive and structural metadata, and presenting the results to the public in a modern and convenient way.

For more information, visit the [Kitodo homepage](https://www.kitodo.org). You can also follow Kitodo News on [Twitter](https://twitter.com/kitodo_org).

# Docker instructions
The Docker images were built by [Mannheim University Library](https://en.wikipedia.org/wiki/Mannheim_University_Library).

### Select branch
There are different [branches](https://github.com/UB-Mannheim/kitodo-presentation-docker/branches) that serve to provide different installations.
While the main branch always offers the latest presentation version, the others provide the following versions:

#### Presentation:
| **branch** 	| **dfg-viewer** 	| **presentation** 	| **solr** 	| **base image** 	| **last update** 	|
|---	|---	|---	|---	|---	|---	|
| [main](https://github.com/UB-Mannheim/kitodo-presentation-docker) 	| - 	| [newest](https://github.com/kitodo/kitodo-presentation/releases) 	| [8.11.x](https://github.com/apache/solr-docker/tree/main/8.11) 	| [typo3-v13](https://github.com/csidirop/typo3-docker/tree/typo3-v13.x) 	| [![GitHub last commit (branch)](https://img.shields.io/github/last-commit/UB-Mannheim/kitodo-presentation-docker/main?label=%20)](https://github.com/UB-Mannheim/kitodo-presentation-docker/commits/main) 	|
| [presentation-v7.x](https://github.com/UB-Mannheim/kitodo-presentation-docker/tree/presentation-v7.x) 	| - 	| [7.0.0](https://github.com/kitodo/kitodo-presentation/releases/tag/v7.0.0) 	| [8.11.x](https://github.com/apache/solr-docker/tree/main/8.11) 	| [typo3-v13](https://github.com/csidirop/typo3-docker/tree/typo3-v13.x) 	| [![GitHub last commit (branch)](https://img.shields.io/github/last-commit/UB-Mannheim/kitodo-presentation-docker/presentation-v7.x?label=%20)](https://github.com/UB-Mannheim/kitodo-presentation-docker/commits/presentation-v7.x) 	|
| [presentation-v6.x](https://github.com/UB-Mannheim/kitodo-presentation-docker/tree/presentation-v6.x) 	| - 	| [6.0.0](https://github.com/kitodo/kitodo-presentation/releases/tag/v6.0.0) 	| [8.11.x](https://github.com/apache/solr-docker/tree/main/8.11) 	| [typo3-v12](https://github.com/csidirop/typo3-docker/tree/typo3-v12.x) 	| [![GitHub last commit (branch)](https://img.shields.io/github/last-commit/UB-Mannheim/kitodo-presentation-docker/presentation-v6.x?label=%20)](https://github.com/UB-Mannheim/kitodo-presentation-docker/commits/presentation-v6.x) 	|
| *presentation-v5.x* | - | - | - | - | - |
| [presentation-v4.x](https://github.com/UB-Mannheim/kitodo-presentation-docker/tree/presentation-v4.x) 	| - 	| [4.1.0](https://github.com/kitodo/kitodo-presentation/releases/tag/v4.1.0) 	| [8.11.x](https://github.com/apache/solr-docker/tree/main/8.11) 	| [typo3-v10](https://github.com/csidirop/typo3-docker/tree/typo3-v10.x) 	| [![GitHub last commit (branch)](https://img.shields.io/github/last-commit/UB-Mannheim/kitodo-presentation-docker/presentation-v4.x?label=%20)](https://github.com/UB-Mannheim/kitodo-presentation-docker/commits/presentation-v4.x) 	|
| [presentation-v3.x](https://github.com/UB-Mannheim/kitodo-presentation-docker/tree/presentation-v3.x) 	| - 	| [3.3.4](https://github.com/kitodo/kitodo-presentation/releases/tag/v3.3.4) 	| - 	| [typo3-v9](https://github.com/csidirop/typo3-docker/tree/typo3-v9.x) 	| [![GitHub last commit (branch)](https://img.shields.io/github/last-commit/UB-Mannheim/kitodo-presentation-docker/presentation-v3.x?label=%20)](https://github.com/UB-Mannheim/kitodo-presentation-docker/commits/presentation-v3.x) 	|


#### Presentation with DFG-Viewer:
| **branch** 	| **dfg-viewer** 	| **presentation** 	| **solr** 	| **base image** 	| **last update** 	|
|---	|---	|---	|---	|---	|---	|
| [dfg-viewer-dev](https://github.com/UB-Mannheim/kitodo-presentation-docker/tree/dfg-viewer-dev) 	| [dev-master](https://packagist.org/packages/slub/dfgviewer#dev-master) 	| [dev-master](https://packagist.org/packages/kitodo/presentation#dev-master) 	| [8.11.x](https://github.com/apache/solr-docker/tree/main/8.11) 	| [typo3-v10](https://github.com/csidirop/typo3-docker/tree/typo3-v10.x) 	| [![GitHub last commit (branch)](https://img.shields.io/github/last-commit/UB-Mannheim/kitodo-presentation-docker/dfg-viewer-dev?label=%20)](https://github.com/UB-Mannheim/kitodo-presentation-docker/commits/dfg-viewer-dev) 	|
| [dfg-viewer-6.x](https://github.com/UB-Mannheim/kitodo-presentation-docker/tree/dfg-viewer-6.x) 	| [6.0.0](https://github.com/slub/dfg-viewer/releases/tag/v6.0.0) 	| [4.1.0](https://github.com/kitodo/kitodo-presentation/releases/tag/v4.1.0) 	| [8.11.x](https://github.com/apache/solr-docker/tree/main/8.11) 	| [typo3-v10](https://github.com/csidirop/typo3-docker/tree/typo3-v10.x) 	| [![GitHub last commit (branch)](https://img.shields.io/github/last-commit/UB-Mannheim/kitodo-presentation-docker/dfg-viewer-6.x?label=%20)](https://github.com/UB-Mannheim/kitodo-presentation-docker/commits/dfg-viewer-6.x) 	|
| [dfg-viewer-6.x-ocr](https://github.com/UB-Mannheim/kitodo-presentation-docker/tree/dfg-viewer-6.x-ocr) 	| [6.x (with OCR-On-Demand)](https://github.com/UB-Mannheim/dfg-viewer/tree/6.x-ocr) 	| [4.x-ocr](https://github.com/UB-Mannheim/kitodo-presentation/tree/4.x-ocr) 	| [8.11.x](https://github.com/apache/solr-docker/tree/main/8.11) 	| [typo3-v10](https://github.com/csidirop/typo3-docker/tree/typo3-v10.x) 	| [![GitHub last commit (branch)](https://img.shields.io/github/last-commit/UB-Mannheim/kitodo-presentation-docker/dfg-viewer-6.x-ocr?label=%20)](https://github.com/UB-Mannheim/kitodo-presentation-docker/commits/dfg-viewer-6.x-ocr) 	|
| [dfg-viewer-5.3](https://github.com/UB-Mannheim/kitodo-presentation-docker/tree/dfg-viewer-5.3) 	| [5.3](https://github.com/slub/dfg-viewer/releases/tag/v5.3.0) 	| [3.3.4](https://github.com/kitodo/kitodo-presentation/releases/tag/v3.3.4) 	| - 	| [typo3-v9](https://github.com/csidirop/typo3-docker/tree/typo3-v9.x) 	| [![GitHub last commit (branch)](https://img.shields.io/github/last-commit/UB-Mannheim/kitodo-presentation-docker/dfg-viewer-5.3?label=%20)](https://github.com/UB-Mannheim/kitodo-presentation-docker/commits/dfg-viewer-5.3) 	|
| [dfg-viewer-5.3-ocr](https://github.com/UB-Mannheim/kitodo-presentation-docker/tree/dfg-viewer-5.3-ocr) 	| [5.3 (with OCR-On-Demand)](https://github.com/UB-Mannheim/dfg-viewer/tree/5.3-ocr) 	| [3.x-ocr](https://github.com/UB-Mannheim/kitodo-presentation/tree/4.x-ocr) 	| [8.11.x](https://github.com/apache/solr-docker/tree/main/8.11) 	| [typo3-v9](https://github.com/csidirop/typo3-docker/tree/typo3-v9.x) 	| [![GitHub last commit (branch)](https://img.shields.io/github/last-commit/UB-Mannheim/kitodo-presentation-docker/dfg-viewer-5.3-ocr?label=%20)](https://github.com/UB-Mannheim/kitodo-presentation-docker/commits/dfg-viewer-5.3-ocr) 	|

<!-- Table created with: https://www.tablesgenerator.com/markdown_tables -->

### Checkout branch
    git checkout <branchname>

### Change credentials
Usernames, passwords and OIDC client credentials are passed as [environment variables](https://docs.docker.com/compose/environment-variables/) and stored inside [.env-File](https://github.com/UB-Mannheim/kitodo-presentation-docker/blob/main/.env.tmpl). The template contains development-only credentials. Change all passwords and client secrets before using the stack outside a local development environment. The `.env` file should only be readable by its owner.

### Environment variables
Copy `.env.tmpl` to `.env` and edit the variables as needed.

The following table shows the default values and a short description.

#### MariaDB Variables:
|        **Name**       | **Default Value** |    **Description**    |
|:----------------------|:-----------------:|:----------------------|
| MARIADB_ROOT_PASSWORD |  _'rootpassword'_ | MariaDB root password |
| MARIADB_USER          |      _typo3_      | MariaDB username      |
| MARIADB_PASSWORD      |    _'password'_   | MariaDB user password |

#### TYPO3 Variables:
|            **Name**            | **Default Value** |                     **Description**                     |
|:-------------------------------|:-----------------:|:--------------------------------------------------------|
| PORT                           |        _80_       | Local port for TYPO3                                    |
| TYPO3_ADMIN_USER               |       _test_      | TYPO3 admin username                                    |
| TYPO3_ADMIN_PASSWORD           |    _'Test1234!'_  | TYPO3 admin password in ''                              |
| TYPO3_ADDITIONAL_CONFIGURATION |      _false_      | Set to true if you want to add additional configuration |
| PQDN                           |    _localhost_    | Partially qualified domain name (eg. _www.test.de_)     |
| PHP_MEMORY_LIMIT               |    _512M_         | PHP memory limit                                        |

#### Keycloak and OIDC Variables:

| Variable | Default | Description |
|:---------|:--------|:------------|
| KEYCLOAK_PORT | 8081 | Local Keycloak port |
| KC_BOOTSTRAP_ADMIN_USERNAME | admin | Keycloak administrator username |
| KC_BOOTSTRAP_ADMIN_PASSWORD | admin | Keycloak administrator password |
| OIDC_REALM | kitodo | Imported Keycloak realm |
| OIDC_CLIENT_ID | kitodo-presentation | Confidential OIDC client ID |
| OIDC_CLIENT_SECRET | kitodo-presentation-secret-change-me | Shared client secret used by Keycloak and TYPO3 |
| OIDC_REQUIRED_ROLE | image-reader | Keycloak realm role mapped to a TYPO3 frontend group |
| OIDC_BROWSER_BASE_URL | http://localhost:8081 | Keycloak URL reachable by the browser |
| OIDC_INTERNAL_BASE_URL | http://keycloak:8080 | Keycloak URL reachable inside the Compose network |
| OIDC_REDIRECT_URI | http://localhost/ | Exact TYPO3 callback URI registered in Keycloak |
| OIDC_WEB_ORIGIN | http://localhost | Browser origin registered in Keycloak |

If TYPO3 is exposed on a different hostname, scheme, or port, update `PQDN`, `PORT`, `OIDC_REDIRECT_URI`, and `OIDC_WEB_ORIGIN` together. The redirect URI must include the trailing slash and exactly match the public TYPO3 URL.

### Access rights and OpenID Connect

The startup script installs `kitodo/accessrights:@dev` from
`packages/kitodo-accessrights`, plus `kitodo/presentation:^7.0` and
`causal/oidc:^5.0.1`. Clone the local
[Kitodo.AccessRights checkout](https://github.com/kitodo-rbo/kitodo-accessrights)
into that package directory before building the stack.

The imported realm sends realm roles in the top-level `Roles` claim expected by `causal/oidc`. During TYPO3 initialization, the `image-reader` role (or `OIDC_REQUIRED_ROLE`) is mapped to a frontend user group.

Keycloak includes two development users:

- `reader / reader123` has the required role and can be mapped to a TYPO3 frontend user.
- `blocked / blocked123` has no required role and is denied when no other frontend group mapping applies.

Add the **OIDC Login** content element to a TYPO3 login page to start the frontend login flow. The `causal/oidc` site set and standard user-field mapping are enabled by the generated site configuration.

### solr
Apache Solr is an open-source search platform with full-text search, hit highlighting, faceted search and real-time indexing.
To create an additional solr container use the docker profile `with-solr` when starting the containers.

### phpmyadmin
[phpMyAdmin](https://www.phpmyadmin.net/) is a web-based tool for managing MySQL/MariaDB databases.
To create an additional phpMyAdmin container use the docker profile `with-phpmyadmin` when starting the containers.

### Run images:
    docker compose up

or with solr

    docker compose --profile with-solr up

or with phpMyAdmin

    docker compose --profile with-phpmyadmin up

The optional profiles can also be combined:

    docker compose --profile with-solr --profile with-phpmyadmin up

### Ready:
TYPO3 backend can be accessed at: http://localhost/typo3/ (of whatever you set as PQDN)

The Keycloak administration console is available at http://localhost:8081/admin/ with the configured bootstrap administrator credentials.


### Run further scripts:
You can customize your setup by adding additional scripts! Just throw them into `/data/scripts/` and make sure they are ending with `.sh`. As soon as the entryscript has setup TYPO3 and the extensions it will run the additional scripts.   
**Because the scripts will be executed as root they can break the system!**

You can temporally disable your scripts by changing the extension to something else like `.off`. You can even add more directories your scripts can refer to.

### Local extensions

Place project-specific TYPO3 extensions and site packages in `packages/`.

## Code and User Feedback
Please file your bug reports to [issues](https://github.com/UB-Mannheim/kitodo-presentation-docker/issues).
Make sure that you are using the latest version of the software before sending a report.

This also means making sure that old docker caches/images/containers are not present **before** making a clean install:
- no old typo3-docker images are present: 
  - `docker images` should not show any typo3-docker image
  - otherwise remove it with `docker rmi <image-ids>`
- no presentation-containers present:
  - `docker container ls -a` should not show any kitodo-presentation container
  - run `docker compose down` to stop and remove containers and networks created by `docker compose up`; volumes and images are only removed when using `--volumes` and `--rmi`, respectively. Because this stack does not currently configure a persistent database volume, removing the database container also removes its data.
  - run `docker rm <container_ID/NAME>` if anything kitodo-presentation related still present
- build without using cached layers (may take a while):
  - `docker compose build --no-cache`

##### Common practice:
1. `docker compose down` or `docker compose --profile with-solr down`
2. `docker compose up --build` or `docker compose --profile with-solr up --build`
