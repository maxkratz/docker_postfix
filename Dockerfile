# Use Debian Bookworm
FROM debian:bookworm
LABEL maintainer="Max Kratz <github@maxkratz.com>"
ENV DEBIAN_FRONTEND=noninteractive

# Update and install various packages
RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq lsb-release locales bash-completion tzdata sudo

# Use en utf8 locales
RUN sudo locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# Install specific packages
RUN sudo apt-get install -y postfix
# RUN sudo apt install -y rsyslog

# Remove apt lists (for storage efficiency)
RUN sudo rm -rf /var/lib/apt/lists/*

# Create a log file and mailname if it does not exist
RUN touch /var/log/postfix.log
RUN touch /etc/mailname

# Configure postfix to use custom logfile
RUN postconf maillog_file=/var/log/postfix.log

# Run postmap to create hashes, start postfix, and tail logfile
CMD postmap /etc/postfix/relay_recipients && \
    /etc/init.d/postfix start && \
    tail -f /var/log/postfix.log
