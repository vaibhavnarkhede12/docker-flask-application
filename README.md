# docker-flask-application
basic flask application configured on a docker container 

# to run this configuration download the repo 
1. docker build  --progress=plain -t flask:0.1 . // --progres=plain gives detailed output  include --no-cache  if you want to do a fresh build of image 
2. docker run -d -p 3006:80 flask:0.1   // any port can be used instead of 3006
