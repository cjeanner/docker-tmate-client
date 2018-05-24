whale-mate
----------
Put your tmate in a container

What is tmate?
--------------
Please have a look [here](https://tmate.io/)

Why would I need to run it in a container?
------------------------------------------
You actually want to give a complete remote access to your computer
to some remote user? Really?

OK, how does it work?
---------------------
Just clone this repository, go inside and run `docker-compose up -d`. Once the
container is up, you'll be able to run a tmate inside it, using
`docker exec -ti tmate_tmate_1 run_tmate`

```Bash
git clone https://github.com/cjeanner/docker-tmate-client
cd docker-tmate-client
docker-compose up -d
docker exec -ti tmate_tmate_1 run_tmate
```

The "run_tmate" is a wrapper - there are some issues with the TTY provided by
docker when you use the `-ti` option.
If you want to knowm more, [read this](https://github.com/moby/moby/issues/8755)

Shared volumes
--------------
The following files/directories are shared in the container if you use the
provided docker-compose:
- ~/work (read-write)
- ~/.ssh/id_rsa (read-only)
- ~/.gitconfig (read-only)

Please ensure you have a password set on your private SSH key. Not kidding, you
really should have one, especially if you share things with tmate.

Sudo in da place
----------------
Sometime, you'll want to get some fancy packages for your work. Well, provided
your dream package is an RPM, you're able to install it - sudo is present by
default and allows you to do whatever you want in your container.

This can, of course, cause some issues. Use it wisely. Or not. I don't care
anyway.

Such wow, such nice, such more
------------------------------
Please don't hesitate to provide PR on this project if you feel it lacks
something.
