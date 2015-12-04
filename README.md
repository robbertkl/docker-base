# robbertkl/base

[![](https://badge.imagelayers.io/robbertkl/base:latest.svg)](https://imagelayers.io/?images=robbertkl/base:latest)

Simple Docker base image:

* Based on Debian
* Useful tools like `curl`, `envsubst`, `git` and `nano`
* Additional helper tools `cleaninstall` and `cleanupgrade`
* Serves as a base for [robbertkl/base-s6](https://github.com/robbertkl/docker-base-s6) and single-process images

## Usage

Just extend it in your `Dockerfile` using `FROM`. Example:

```
FROM robbertkl/base

RUN cleaninstall package1 package2 package3

...
```

## Authors

* Robbert Klarenbeek, <robbertkl@renbeek.nl>

## License

This repo is published under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
