# target: help - Display callable targets
help:
	@egrep "^# target:" [Mm]akefile


# target: clean - Clean all ".pyc" files
clean:
	find . -name "*.pyc" -exec rm -rf {} \;


# target: migrate - Migrate all django applications considering app dependencies
migrate:
	python fastcampus/manage.py makemigrations courses users managers
	python fastcampus/manage.py migrate


# target: clean_migration - folders in all django apps
clean_migrations:
	ls fastcampus/ | grep -v -e 'manage.py' | xargs -I{} rm -rf fastcampus/{}/migrations/


# target: loaddata_all - load all data from commands
loaddata_all:
	python fastcampus/manage.py loaddata_users
	python fastcampus/manage.py loaddata_courses
	python fastcampus/manage.py loaddata_enrollments


# target: export_all - export all data from database
export_all:
	mysqldump -u $(DATABASE_USERNAME) -p fastcourses > data/fastcourses.sql
	python fastcampus/manage.py export
