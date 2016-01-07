from django.db import models
from django.contrib.auth.models import UserManager as DefaultUserManager, AbstractUser


class UserManager(DefaultUserManager):
    pass


class User(AbstractUser):

    objects = UserManager()

    name = models.CharField(
        max_length=8,
        verbose_name='이름',
    )

    address = models.CharField(
        max_length=256,
        blank=True,
        null=True,
        verbose_name='주소지',
    )

    # This field can be used in pre-processing practice.
    phonenumber = models.CharField(
        max_length=32,
        blank=True,
        null=True,
        verbose_name='연락처',
    )

    phonenumber_preprocessed = models.CharField(
        max_length=16,
        blank=True,
        null=True,
        verbose_name='전처리된 연락처',
    )

    class Meta:
        verbose_name = '유저'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
