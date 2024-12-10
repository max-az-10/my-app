FROM nginx:1.27-alpine
COPY ./my-app/img /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
