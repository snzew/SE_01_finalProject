# SE_01_finalProject
final project for SE_01 module standard assessment

Hi, 

This project is about a recommendation system for travel location based on your selected keywords.
The backend is a restfull API developped with djang Restframework.



Instructions

1. install all the requirements
 -  look for the requirement file in project/app/requirments.txt
 -  install all necessary requirements



2. creat database

- create a (postgres) database with the name "rmm"
- adjust the database settingt in project/readmymind/readmymind/settings.py like this 
              DATABASES = {
                  'default': {
                      'ENGINE': 'django.db.backends.postgresql_psycopg2',
                      'NAME': 'rmm',
                      'USER': 'postgres',
                      'HOST': 'localhost',
                      'PORT': '5432',
                  }
              }
 - 'USER', 'HOST', 'PORT' depends on your database/localhost settings
 
 - load the database file into your database
 
 
 
 
 3. run server
 - start postgres/ database server
 - start djangoserver with "python manage.py runserver"
 
 
 
 4. open app
 - open index.html file in project/frontend/index.html
 
 
 
 5. enjoy:)
 
 
