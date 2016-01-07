from django.db import models
from django.contrib.auth.models import UserManager as DefaultUserManager, AbstractUser


class UserManager(DefaultUserManager):
    pass


class User(AbstractUser):

    objects = UserManager()

    name = models.CharField(
        max_length=8,
    )

    address = models.CharField(
        max_length=256,
        blank=True,
        null=True,
    )

    class Meta:
        verbose_name = '유저'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
