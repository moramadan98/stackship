# Plain static site (no package.json / build step) — just serve the files.
FROM nginx:alpine
COPY . /usr/share/nginx/html
# SPA-friendly fallback so client-side routes (if any) still resolve to index.html.
RUN printf 'server {\n listen 8080;\n location / {\n root /usr/share/nginx/html;\n try_files $uri $uri/ /index.html;\n }\n}\n' > /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
