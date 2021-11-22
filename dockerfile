FROM ubuntu:20.04
RUN apt-get update --no-upgrade

#set timexone required for apt setup
ENV TZ=Indian
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# set up default workdirectory
WORKDIR  /var/www/html

#install apt packages
RUN apt-get -y install \
    nginx \
    python3-dev \
    # build-essential  \
    pip \
    systemctl \
    python3-venv \
    gunicorn \
    tree \
    vim

# install pip packages
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt 

# copy flask application and wsgi as end point for gunicorn 
# /var/www/html is the working directory for gunicorn server
COPY myproject.py /var/www/html/
COPY wsgi.py /var/www/html


#create service for  flask appliaction 
COPY myproject.service /etc/systemd/system/myproject.service 

#copy nginx conf as default in sites enabled 
COPY codingx.in /etc/nginx/sites-enabled/default

#start both services 
CMD [ "systemctl","start", "myproject","nginx" ]