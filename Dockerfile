# Use TYPO3 v13 base image based on Apache2
# https://hub.docker.com/r/csidirop/typo3-v13/
# https://github.com/csidirop/typo3-docker/tree/typo3-v13.x
FROM csidirop/typo3-v13:latest
LABEL authors='Christos Sidiropoulos <Christos.Sidiropoulos@uni-mannheim.de>'

EXPOSE 80
# Set PHP memory limit (default: 512M) fallback:
ARG PHP_MEMORY_LIMIT=512M
ARG XDEBUG_VERSION=3.5.3

# This Dockerfile installs TYPO3 v13 with the kitodo/presentation extension
# based on this guide: https://github.com/UB-Mannheim/kitodo-presentation/wiki

# Install envsubst and Xdebug. The temporary compiler packages are removed again
# after PECL has built the extension.
RUN apt-get update \
  && apt-get install -y --no-install-recommends gettext-base $PHPIZE_DEPS \
  && pecl install xdebug-${XDEBUG_VERSION} \
  && apt-get purge -y --auto-remove $PHPIZE_DEPS \
  && rm -rf /var/lib/apt/lists/*

# Copy startup script and data folder into the container:
COPY --chmod=0755 docker-entrypoint.sh docker-entrypoint-aux.sh /
COPY data/ /data/
COPY xdebug.ini /usr/local/etc/php/conf.d/99-xdebug.ini

# Set PHP memory limit:
RUN sed -i "s/memory_limit = .*/memory_limit = ${PHP_MEMORY_LIMIT}/" /usr/local/etc/php/php.ini

# Run setup synchronously. The script starts Apache as the final PID 1 process.
CMD ["/docker-entrypoint.sh"]
