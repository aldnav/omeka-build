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
docker build -t omeka:dev .
```

Composing the project:  
```sh
cd omeka-build
docker-compose up -d
```

Operating on the docker build:  
```sh
docker volume create file-vol
docker volume ls
docker volume inspect file-vol
docker run --rm -d \
-p 4000:80 \
-v file-vol:/var/www/html/files \
--name omekabox \
omeka:dev
docker exec -it omekabox bash  # debug
docker stop omekabox
```

Deployment:
```sh
docker pull aldnav/omeka:alpha
docker volume create file-vol
docker volume ls
docker volume inspect file-vol
docker run --rm -d \
-p 80:80 \
-v file-vol:/var/www/html/files \
--name omekabox \
aldnav/omeka:alpha
```

Omeka installation  
Go to `http://localhost:4000/install/`
