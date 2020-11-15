# python 3.8 was not working properly when
# bootstarpping locally the Django project
FROM python:3.7-alpine

# the WORKDIR specifies in which folder, inside the running container, the project files will be placed
# it also affects the initial directory that commands will run in when using `exec` e.g. `docker exec -it 7d5046cfd7fe sh`
WORKDIR /usr/src/app

# minimizing Cache Busting and Rebuilds - 
# split copying of resources in order to prevent changes in the project files (index.js) from running the packages installations again
# since the packages themselves might have not changed at all
# only changes to requirements.txt will affect the pip install
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./ ./

CMD [ "python", "./mysite/manage.py", "runserver", "0.0.0.0:8000" ]