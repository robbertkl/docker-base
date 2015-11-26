# robbertkl/base

[![](https://badge.imagelayers.io/robbertkl/base:latest.svg)](https://imagelayers.io/?images=robbertkl/base:latest)

Simple Docker base image:

* Based on Debian
* Uses [s6-overlay](https://github.com/just-containers/s6-overlay)
* Runs `cron` and `rsyslogd` services
* Helper service to output arbitrary logs to `stdout` or `stderr`
* Useful tools like `curl`, `envsubst`, `git` and `nano`
* Additional helper tools `cleaninstall` and `cleanupgrade`
* Basic SSL certificate preparation

## Usage

Just extend it in your `Dockerfile` using `FROM`. Example:

```
FROM robbertkl/base

RUN cleaninstall package1 package2 package3
RUN echo /var/log/custom.log >> /etc/services.d/logs/stderr

...
```

## Logging

To have your custom logs show up in `docker logs`, you can append your name to either `/etc/services.d/logs/stdout` or `/etc/services.d/logs/stderr`.

## SSL

As a convention, please copy or mount your SSL files to `/private/ssl` named `cert.pem`, `key.pem` and `ca.pem`. A default (snakeoil) certificate will be provided as a fallback. Create custom (combined) pem bundles from these files in your s6 `run` script.

## Authors

* Robbert Klarenbeek, <robbertkl@renbeek.nl>

## License

This repo is published under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
