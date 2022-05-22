# Create project
start_proj:
    django-admin startproject books

# Create new app inside all project
cr_app:
    ./manage.py startapp store

connect_db:
    sudo docker-compose exec db psql --username=ilya --dbname=book

run:
    ./manage.py runserver

# Create createsuperuser
cr_sup:
    sudo docker exec -it books_web_1 python manage.py createsuperuser

# make migrations (create migration file)

mm:
    sudo docker-compose exec web python manage.py makemigrations

# apply migrations
migrate:
    sudo docker-compose exec web python manage.py migrate

# Run tests
run_tests:
    sudo docker-compose exec web python manage.py test store.tests

# Create dump data:

dump:
    sudo docker-compose exec web python manage.py dumpdata > testdata.json