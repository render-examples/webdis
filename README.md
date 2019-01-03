# Webdis + Redis

[Webdis](https://webd.is) is a "fast HTTP interface for Redis". In this example, you'll set up a
private Redis server and a public Webdis server and connect them.

## Create a private Redis server

1. Create a new private service on Render using the
   [render-examples/redis](https://github.com/render-examples/redis) repository.

2. Give it a name. We recommend "redis".

3. Save. You'll be brought to the deployment page. Note the service address which looks something
   like `redis:10000`. This will be used by Webdis.

## Create a public Webdis server

1. Create a [new web service on Render](https://dashboard.render.com/select-repo?type=web) using this repository.

2. Give it a name. "webdis" isn't so bad.

3. In the Advanced settings, add an environment variable named `REDIS_HOST` with the host part of
   your Redis service address (the part before the colon (:)).

   Add another environment variable named `REDIS_PORT` with the port part of your Redis service
   address (the part after the colon(:)).

4. Save. It'll be up shortly. Try a few HTTP requests against webdis:

       curl https://${slug}.app.render.com/SET/hello/world
	   curl https://${slug}.app.render.com/GET/hello
	   curl https://${slug}.app.render.com/LPUSH/mylist/hello/world
	   curl https://${slug}.app.render.com/LLEN/mylist
