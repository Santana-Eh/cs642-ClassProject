### This code was found somewhere on Github and added to - not my original work - giving credit to owner

# Install Nginx
ADD nginx.repo /etc/yum.repos.d/
RUN cd /tmp && \
  curl -O http://nginx.org/keys/nginx_signing.key && \
  rpm --import nginx_signing.key && \
  yum update -y && \
  yum install -y nginx
  yum install -y python
  
#Add Default conf file or customized one
COPY nginx.conf /etc/nginx/nginx.conf

# Clean Up
RUN yum clean all && rm -rf /tmp/nginx*

EXPOSE 80

#Command which will run once container is created 
CMD ["nginx", "-g", "daemon off;"]
