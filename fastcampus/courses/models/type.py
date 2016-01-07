from django.db import models


class TypeManager(models.Manager):
    pass


class Type(models.Model):

    name = models.CharField(
        max_length=8,
        unique=True,
        verbose_name='이름',
    )
    slug = models.SlugField(
        unique=True,
    )

    objects = TypeManager()

    class Meta:
        verbose_name = '타입'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
