Set up a python web application by running `make`.

# Dependencies

    python3
    uwsgi --with-python3
    nginx

# Setup

To run a site on `nginx`, one needs to link a site configuration to the appropriate directory.

Since every distribution has its own default configuration, this is only a hint to where the right place might be. Please find and check your `nginx.conf` for a line such as `include sites-enabled/*;`.

## Linux

    ln -s $(PWD)/*.server /etc/nginx/sites-enabled/

## Mac

Assuming dependencies are installed with `homebrew`

    ln -s $(PWD)/*.server /usr/local/etc/nginx/servers/

# Deployment

Have your root password ready to update `/etc/hosts`.

    make run
    make stop

You can test the result with

    curl http://$(basename ${PWD}):8080

For live deployment you might want to update `app.server` with the correct server name and port.

# Cleanup

To remove everything except the link in the nginx config

   make clean

This will also remove the newly created line in `/etc/hosts`.

