# Dependencies

    python3
    uwsgi --with-python3
    nginx

# Setup

To run a site on `nginx`, one needs to link a site configuration in the appropriate directory.

## Linux

    ln -s $(PWD)/*.server /etc/nginx/sites-enabled/

## Mac

Assuming dependencies are installed with `homebrew`

    ln -s $(PWD)/*.server /usr/local/etc/nginx/servers/

# Deployment

Have your root password ready to update `/etc/hosts`.

    make run
    make stop

Make will install the app in a virtual environment that has the dependencies listed in `requirements.txt`.

In the current configuration, `uwsgi` watches the working directory, so changing the sources will reload the app.

You can test the result with

    curl http://$(basename ${PWD}):8080

For live deployment you might want to update `app.server` with the correct server name and port.

# Cleanup

To remove everything except the link in the nginx config

   make clean

This will also remove the newly created line in `/etc/hosts`.

