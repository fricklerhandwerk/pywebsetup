all:

run: prepare
	uwsgi --ini ${PWD}/`basename ${PWD}`.ini --pidfile uwsgi.pid &
	nginx

stop:
	kill -9 `cat uwsgi.pid` && rm uwsgi.pid
	nginx -s stop

prepare: virtualenv log
	./setup.sh

virtualenv:
	virtualenv virtualenv && \
	. virtualenv/bin/activate && \
	pip install -r requirements.txt . && \
	deactivate

log:
	mkdir log

clean:
	rm -rf log
	rm -rf virtualenv
	rm -rf *.pid
	rm -rf *.pyc
	rm `basename ${PWD}`.ini
	rm `basename ${PWD}`.server
	sudo sed -i "/`basename ${PWD}`/d" /etc/hosts

