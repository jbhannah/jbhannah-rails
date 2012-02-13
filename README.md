# jbhannah.net

This is the code that powers [jbhannah.net](http://jbhannah.net/), built
in Ruby on Rails and configured to run in a production environment of
nginx, reverse-proxied to a Thin cluster, with PostgreSQL as the
database backend. Deployment is done using Capistrano.

## Requirements

The server jbhannah.net is hosted on is a [Linode
VPS](http://www.linode.com) running the latest release of Ubuntu Server,
firewalled to allow connections only over ports 80 (www) and 22 (ssh).
All requirements are described under that assumption.

### User

A user called `jbhannah` exists and is SSH private-key enabled. The user
is allowed to run commands with `sudo`.

### Ruby

Ruby 1.9.3 is installed via a system-wide (root)
[RVM](http://beginrescueend.com/rvm/) installation. A gemset called
`jbhannah` is specified in an `.rvmrc` file and Capistrano's
`config/deploy.rb` into which all gems are installed.

### Javascript runtime

[Node.js](http://nodejs.org/) is installed through `apt` via a PPA:

    $ sudo add-apt-repository ppa:chris-lea/node.js
    $ sudo apt-get update
    $ sudo apt-get install nodejs

### nginx

The latest version of [nginx](http://nginx.org/) is installed through
`apt` with the default configuration enabled and the directive

    listen   [::]:80 default ipv6only=on;

uncommented in the server block, allowing IPv6 connections over a
dedicated socket.

### PostgreSQL

The latest version of [PostgreSQL](http://www.postgresql.org/) is
installed through `apt` without any configuration changes. A user called
`jbhannah` is created:

    $ sudo -u postgres createuser jbhannah
    Shall the new role be a superuser? (y/n) n
    Shall the new role be allowed to create databases? (y/n) y
    Shall the new role be allowed to create more new roles? (y/n) n

Since the app is run under the same username, local database connections
are allowed via `ident` authentication, which is the default in
PostgreSQL on Ubuntu.

## Deployment

From the local development machine:

    $ cap deploy:setup
    $ cap deploy:check
    $ cap deploy
