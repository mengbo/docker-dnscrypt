docker-dnscrypt
=================

[DNSCrypt][dnscrypt] for Docker.
[dnscrypt]: http://dnscrypt.org/

## Image Creation

This example creates the image with the tag `mengbo/docker-dnscrypt`, but you can
change this to use your own username.

```
$ docker build -t="mengbo/docker-dnscrypt" .
```

Alternately, you can run the following if you have *make* installed...

```
$ make
```

You can also specify custom variables by change the Makefile.


## Environment variables

 - `RESOLVER_NAME`: Resolver name of dnscrypt. Default: `opendns`
