import os
import random

from django.conf import settings
from django.core.management.base import BaseCommand

from users.models import User
from courses.models import Course, Enrollment


class Command(BaseCommand):
    help = "Install Enrollment fixture(s) in the database."

    def add_arguments(self, parser):
        pass

    def handle(self, *args, **options):

        # This is not recommended for loading fixtures.
        # In Real-life, should use django built-in loaddata fixtures feature.

        # Delete legacy users.
        Enrollment.objects.all().delete()

        for course in Course.objects.all():
            course_enrollments_count = random.randint(20, 30)

            random_selected_users = User.objects.order_by('?')[:course_enrollments_count]

            for random_selected_user in random_selected_users:
                enrollment, enrollment_created = course.enrollment_set.get_or_create(
                    user=random_selected_user,
                )

            self.stdout.write("Successfully created {enrollments_count} enrollments in <{course_name}> course.".format(
                enrollments_count=course.enrollment_set.count(),
                course_name=course.name,
            ))
