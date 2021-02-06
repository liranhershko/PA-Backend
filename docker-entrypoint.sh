#!/bin/bash

# Collect static files
# echo "Collect static files"
# python mysite/manage.py collectstatic --noinput

# Apply database migrations
echo "Apply database migrations"
python mysite/manage.py migrate

# Apply database migrations
echo "Creating superuser"
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'liran.hershko@gmail.com', 'password')" | python mysite/manage.py shell

# Start server
echo "Starting server"
python mysite/manage.py runserver 0.0.0.0:8000
