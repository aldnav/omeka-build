OMEKA BUILD
---

This is a docker build for Omeka Classic.

Requirements as per [Omeka documentation](https://omeka.org/classic/docs/Installation/System_Requirements/)

* Apache HTTP server (with mod_rewrite enabled)
* MySQL version 5.0 or greater
* PHP scripting language version 5.3.2 or greater (with mysqli and exif extensions installed)
* ImageMagick image manipulation software (for resizing images)

Building the project:
```sh
docker build -t omeka:v1 .
```

Composing the project:  
```sh
cd omeka-build
docker-compose up -d
```

Operating on the docker build:  
```sh
docker run --rm -d -p 4000:80 --name omekabox omeka:v1
docker exec -it omekabox bash  # debug
docker stop omekabox
```

Omeka installation  
Go to `http://localhost:4000/install/`
