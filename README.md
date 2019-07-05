# nginx-cats

Wrapper to [nginx](https://hub.docker.com/_/nginx) docker image that supplies http error [cats](https://http.cat/).

The build is obvisouly hardcoded to a specific nginx release, currently set to `1.15.8`.

## Docker Image

[![](https://images.microbadger.com/badges/version/reallyliri/nginx-cats.svg)](https://microbadger.com/images/reallyliri/nginx-cats "Get your own version badge on microbadger.com")

Available on [Dockerhub](https://hub.docker.com/r/reallyliri/nginx-cats) or by pulling `reallyliri/nginx-cats:1.15.8`.

## How it works

nginx has a built in fallback page per error code. We simply need to add the following to our nginx configuration file:

```
error_page  403  /403.html;
error_page  404  /404.html;
error_page  500  /500.html;
error_page  502  /502.html;
error_page  503  /503.html;
error_page  504  /504.html;
```

These are the most commonly needed error codes, you can also add your own, they are easily generated with the following command:

`sed -e 's/HTTP_CODE/504/g;s/MESSAGE/Gateway Timeout/g' error_page.html`

Just replace the code and message. See in [Dockerfile](./Dockerfile)

You could add more codes and also copy the relevant parts to your own custom nginx-based images.

## Build

`docker build -t nginx-cats .`

## Run

With the default configuration file used, the server is empty and running on port 80.

`docker run -d --name nginx -p 80:80 nginx-cats`

Navigating to `http://localhost` will give us the default nginx welcome page

![welcome](https://i.imgur.com/CWbPHHo.png)

But triggering 404 (i.e navigating to `http://loclahost/foo`) will retrieve our custom error page:

![404](https://imgur.com/hbcNoDm.png)
