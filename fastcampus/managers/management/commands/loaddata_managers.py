import os

from django.conf import settings
from django.core.management.base import BaseCommand

from managers.models import Manager

import requests
import lxml.html


class Command(BaseCommand):
    help = "Install Managers fixture(s) in the database."

    def add_arguments(self, parser):
        pass

    def handle(self, *args, **options):

        # 패스트캠퍼스 > About Us > Our Team
        # 페이지를 크롤링하여 패스트캠퍼스 매니저 인스턴스를 생성

        Manager.objects.all().delete()

        response = requests.get("http://www.fastcampus.co.kr/about-fc/")
        assert response.status_code is 200

        dom = lxml.html.fromstring(response.content)

        manager_elements = dom.cssselect('div.page-section-content div.vc_custom_1444712446393 div.wpb_row div.vc_col-sm-3.wpb_column.column_container')

        for manager_element in manager_elements:

            # 맨 밑에 row 의 경우에는 매니저 정보가 등록되어 있지 않은 경우도 있다.
            if manager_element.cssselect('.mk-toggle-title strong'):
                name = manager_element.cssselect('.mk-toggle-title strong')[0].text
                position = manager_element.cssselect('.mk-toggle-title')[0].text_content().replace(name, '').replace('|', '').strip()
                description = manager_element.cssselect('.mk-toggle-pane')[0].text_content().replace('\n', ' ')

                self.stdout.write("{name}, {position}".format(
                    name=name,
                    position=position,
                    # description=description,
                ))

                manager = Manager.objects.get_or_create(
                    name=name,
                    position=position,
                    description=description,
                )


        # 남자 매니저님들의 경우에는 성별을 남자로 변경
        # 이 부분은 자동화 하지 못한 점이 아쉽지만 딱히 할 수 있는 방법이 없었다.
        # 남자 매니저님들 수가 여자 매니저님들 수 보다 적어서 여자를 기본으로 하였다.

        male_manager_names = [
            '이강민',
            '이성훈',
            '신해동',
            '류지환',
            '정의석',
            '이찬희',
            '최동혁',
        ]

        for male_manager_name in male_manager_names:
            male_manager = Manager.objects.get(
                name=male_manager_name,
            )

            male_manager.gender = '남자'
            male_manager.save()

        self.stdout.write("Successfully created {manager_count} managers.".format(
            manager_count=Manager.objects.count(),
        ))
