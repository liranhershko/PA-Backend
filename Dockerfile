# python 3.8 was not working properly when
# bootstarpping locally the Django project
# TODO: I could not use alpine image and install mysqlclient - check how to do that?
FROM python:3.7

# ensures that the output Django writes to the terminal comes out in real time without being buffered somewhere.
# This makes your Docker logs useful and complete.
ENV PYTHONUNBUFFERED 1

# the WORKDIR specifies in which folder, inside the running container, the project files will be placed
# it also affects the initial directory that commands will run in when using `exec` e.g. `docker exec -it 7d5046cfd7fe sh`
WORKDIR /usr/src/app

# minimizing Cache Busting and Rebuilds - 
# split copying of resources in order to prevent changes in the project files (index.js) from running the packages installations again
# since the packages themselves might have not changed at all
# only changes to requirements.txt will affect the pip install
COPY requirements.txt ./
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

COPY ./ ./

# this is so ew can wait for the mysql db to be "ready"
RUN apt-get -q update && apt-get -qy install netcat
RUN ["chmod", "+x", "/usr/src/app/wait-for.sh"]
# CMD [ "python", "./mysite/manage.py", "runserver", "0.0.0.0:8000" ]
CMD ["./wait-for.sh", "mysql_db:3306", "--", "python", "./mysite/manage.py", "runserver", "0.0.0.0:8000"]