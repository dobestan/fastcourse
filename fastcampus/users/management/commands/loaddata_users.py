import os
import random
from datetime import datetime
from datetime import timedelta

from django.conf import settings
from django.core.management.base import BaseCommand

from users.models import User

from faker import Factory

from users.utils.date import get_random_date


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
        user_count = 10000

        start_date = datetime.strptime('01/01/2013 1:00 PM', '%m/%d/%Y %I:%M %p')
        end_date = datetime.strptime('12/31/2015 1:00 PM', '%m/%d/%Y %I:%M %p')

        popular_domains = [
            "naver.com",
            "daum.net",
            "gmail.com",
        ]

        # Delete legacy users.
        User.objects.filter(username__startswith=username_prefix).delete()

        for i in range(0, user_count):
            username = '%s_%03d' % (username_prefix, i+1, )
            name = fake.name()
            address = fake.address().replace('\n', '').replace('  ', ' ')  # Faker address generator contains newline character.
            age = random.randint(20, 50)

            email_domain = random.choice(popular_domains)
            email = "{username}@{email_domain}".format(
                username=username,
                email_domain=email_domain,
            )

            is_male = bool(random.getrandbits(1)) # 성별

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

            # Cohort 분석을 위한 실습 데이터 생성
            # 유료 전화로 문의한 사람들의 구매 비율이 더 높다.

            date_joined = get_random_date(start_date, end_date)

            is_called = random.randint(1, 100) < 25  # 25% 의 사람들은 전화로 문의한다.
            if is_called:
                is_enrolled = random.randint(1, 100) < 80  # 전화로 문의한 사람들 중 80% 는 등록한다.
            else:
                is_enrolled = random.randint(1, 100) < 30  # 전화로 문의하지 않은 사람들 중 30%만 등록한다.

            date_called = None
            date_enrolled = None

            # 일단 전화로 문의한 사람들
            # 가입후 10일 이내에 전화를 한다.
            if is_called:
                date_called = date_joined + timedelta(random.randint(1, 10*10)/10)

            # 전화없이 가입한 사람은
            # 30일 이내에 등록한다.
            if is_enrolled and not is_called:
                date_enrolled = date_joined + timedelta(random.randint(1, 30*10)/10)

            # 전화를 한 사람들은
            # 전화 후 3일 이내에 등록한다.
            if is_called and is_enrolled:
                date_enrolled = date_called + timedelta(random.randint(1, 3*10)/10)

            user = User.objects.create(
                username=username,
                name=name,
                address=address,
                phonenumber=phonenumber,
                phonenumber_preprocessed=phonenumber_preprocessed,
                age=age,
                email=email,
                is_male=is_male,

                date_joined=date_joined,
                date_called=date_called,
                date_enrolled=date_enrolled,
            )

            self.stdout.write("{username}, {name}, {age}, {email}, {address}, {phonenumber_preprocessed}, {phonenumber}".format(
                username=username,
                name=name,
                age=age,
                email=email,
                address=address,
                phonenumber_preprocessed=phonenumber_preprocessed,
                phonenumber=phonenumber,
            ))

        self.stdout.write("Successfully created {user_count} users.".format(
            user_count=user_count,
        ))
