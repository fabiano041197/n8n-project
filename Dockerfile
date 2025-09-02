FROM n8nio/n8n:latest

# Switch to root user to install packages and modify system directories
USER root

# Install necessary system packages using apk
# build-base, python3-dev, geoip-dev are needed for potential native dependencies
# wget for downloading, git for source control (might be needed by Go), bash (useful shell)
RUN apk update && \
    apk add --no-cache \
        wget \
        ffmpeg


ENV N8N_HOST=${SUBDOMAIN}.${DOMAIN_NAME}
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV WEBHOOK_URL=https://${SUBDOMAIN}.${DOMAIN_NAME}/

# Switch back to the non-root user that n8n runs as (typically 'node')
USER node
