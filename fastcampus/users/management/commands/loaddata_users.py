import os
import random

from django.conf import settings
from django.core.management.base import BaseCommand

from users.models import User

from faker import Factory


class Command(BaseCommand):
    help = "Install Users fixture(s) in the database."

    def add_arguments(self, parser):
        pass

    def handle(self, *args, **options):

        # This is not recommended for loading fixtures.
        # In Real-life, should use django built-in loaddata fixtures feature.

        fake = Factory.create('ko_KR')

        self.stdout.write(fake.name())
        self.stdout.write(fake.address())

        username_prefix = 'fastcampus'
        user_count = 100

        # Delete legacy users.
        User.objects.filter(username__startswith=username_prefix).delete()

        for i in range(0, user_count):
            username = '%s_%03d' % (username_prefix, i+1, )
            name = fake.name()
            address = fake.address().replace('\n', '').replace('  ', ' ')  # Faker address generator contains newline character.

            phonenumber_preprocessed = "010" + "".join([str(random.randint(0, 9)) for i in range(0, 8)])
            phonenumber = phonenumber_preprocessed

            # Random Boolean
            if bool(random.getrandbits(1)):
                phonenumber = "{start}-{middle}-{end}".format(
                    start=phonenumber_preprocessed[:3],
                    middle=phonenumber_preprocessed[3:-4],
                    end=phonenumber_preprocessed[-4:],
                )

                if bool(random.getrandbits(1)):
                    phonenumber = phonenumber.replace('010', '8210').replace('-', '')

            user = User.objects.create(
                username=username,
                name=name,
                address=address,
                phonenumber=phonenumber,
                phonenumber_preprocessed=phonenumber_preprocessed,
            )

            self.stdout.write("{username}, {name}, {address}, {phonenumber_preprocessed}, {phonenumber}".format(
                username=username,
                name=name,
                address=address,
                phonenumber_preprocessed=phonenumber_preprocessed,
                phonenumber=phonenumber,
            ))

        self.stdout.write("Successfully created {user_count} users.".format(
            user_count=user_count,
        ))
