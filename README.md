how-to
******

#run alpine and check that package aren't installed
---------------------------------------------------
docker run -it --rm alpine /bin/sh
whoami
vim --help
git --help
curl --help

#generate Dockerfile
#-------------------
FROM alpine:3.4
MAINTAINER Stephane Rey stephane.rey@wago.com
RUN apk update
RUN apk add vim curl


#copy source from windows host and log in linux system
#-----------------------------------------------------
pscp * root@10.203.21.131:/var/tmp
cd /var/tmp

#build an image from Dockerfile
#------------------------------
docker build -t stephrey/myalpine:1.0 .

#list all images
#---------------
docker images -a

#remove dangling images
#----------------------
docker images --filter "dangling=true"
docker rmi $(docker images -q --filter "dangling=true")

#try the image again
#-------------------
docker run -it --rm stephrey/myalpine:1.0 /bin/sh
whoami
vim --help
git --help
curl --help
exit

#pull the images on your docker hub account
#------------------------------------------
docker login
stephrey:ufoga73i...
docker push stephrey/myalpine:1.0
