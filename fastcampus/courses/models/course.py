from django.conf import settings
from django.db import models

from .enrollment import Enrollment


class CourseManager(models.Manager):

    def get_queryset(self):
        return super(models.Manager, self).get_queryset().select_related(
            'type',
        )


class Course(models.Model):

    type = models.ForeignKey(
        'Type',
    )

    name = models.CharField(
        max_length=255,
        unique=True,
        verbose_name='이름',
    )
    slug = models.SlugField(
        unique=True,
    )

    price = models.PositiveIntegerField(
        verbose_name='가격',
        blank=True,
        null=True,
    )

    users = models.ManyToManyField(
        settings.AUTH_USER_MODEL,
        through=Enrollment,
    )

    objects = CourseManager()

    class Meta:
        verbose_name = '코스'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
