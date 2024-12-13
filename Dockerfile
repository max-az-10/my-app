FROM nginx:1.27-alpine
COPY . /usr/share/nginx/html
EXPOSE 7000
CMD ["nginx", "-g", "daemon off;"]

#This is to verify if Git work correctly
