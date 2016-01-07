import os

from django.conf import settings
from django.core.management.base import BaseCommand

from courses.models import Type, Course


class Command(BaseCommand):
    help = "Install Courses fixture(s) in the database."

    def add_arguments(self, parser):
        pass

    def handle(self, *args, **options):

        # This is not recommended for loading fixtures.
        # In Real-life, should use django built-in loaddata fixtures feature.

        types_information = [
            {
                'name': '코스',
                'slug': 'course',
                'courses': [
                    {
                        'name': '업무자동화를 위한 파이썬 입문 CAMP',
                        'slug': 'dev_camp_python4auto',
                        'price': 90,
                    },
                    {
                        'name': '파이썬을 활용한 데이터분석 CAMP',
                        'slug': 'data_camp_pda',
                        'price': 150,
                    },
                ],
            },

            {
                'name': '스쿨',
                'slug': 'school',
                'courses': [
                    {
                        'name': '데이터 사이언스 SCHOOL',
                        'slug': 'data_school_ds',
                        'price': 240,
                    },
                    {
                        'name': '웹 프로그래밍 SCHOOL',
                        'slug': 'dev_school_wp',
                        'price': 240,
                    },
                    {
                        'name': '디지털 마케팅 SCHOOL',
                        'slug': 'mktg_school_dmktg',
                        'price': 240,
                    },
                ],
            },

            {
                'name': '특강',
                'slug': 'special',
                'courses': [
                    {
                        'name': '피키캐스트와 함께하는 "탈우주적 데이터 분석 꿀팁" 무료 세미나',
                        'slug': 'pikicast_seminar_160115',
                        'price': 0,
                    },
                    {
                        'name': '프로그래밍 입문자들을 위한 "불금의 코딩 TALK"',
                        'slug': 'dev_event_bkt_151030_behind',
                        'price': 0,
                    },
                ],
            },
        ]

        for type_information in types_information:

            # FIXME: type is python built-in function, should change to alternative variable name.
            type, type_created =  Type.objects.get_or_create(
                name=type_information.get('name'),
                slug=type_information.get('slug'),
            )

            for course_information in type_information.get('courses'):
                course, course_created = type.course_set.get_or_create(
                    name=course_information.get('name'),
                    slug=course_information.get('slug'),
                    price=course_information.get('price'),
                )

        for course in Course.objects.all():
            self.stdout.write("{type_name}, {name}, {price}".format(
                type_name=course.type.name,
                name=course.name,
                price=course.price,
            ))

        self.stdout.write("Successfully created {type_count} types, and {course_count} courses.".format(
            type_count=Type.objects.count(),
            course_count=Course.objects.count(),
        ))
