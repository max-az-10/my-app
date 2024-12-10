FROM nginx:1.27-alpine
COPY /img /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
