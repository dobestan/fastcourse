from django.db import models


class ManagerManager(models.Manager):
    pass


class Manager(models.Model):

    # 본 프로젝트는 장고 개발이 아니라 SQL 실습용 데이터 생성을
    # 위해서 만든 프로젝트입니다.

    # Manager 라는 이름을 장고 프로젝트에서 사용하는 것은 추천드리지 않습니다.

    name = models.CharField(
        max_length=16,
        verbose_name='이름',
    )

    position = models.CharField(
        max_length=32,
        blank=True,
        null=True,
        verbose_name='직급',
    )

    description = models.TextField(
        verbose_name='설명',
    )

    gender = models.CharField(
        max_length=2,
        default='여자',
        verbose_name='성별',
    )

    objects = ManagerManager()

    class Meta:
        verbose_name = '매니저'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
