from django.conf import settings
from django.db import models


class EnrollmentManager(models.Manager):

    def get_queryset(self):
        return super(models.Manager, self).get_queryset().select_related(
            'user',
            'course',
        )


class Enrollment(models.Model):

    user = models.ForeignKey(settings.AUTH_USER_MODEL)
    course = models.ForeignKey('Course')

    objects = EnrollmentManager()

    class Meta:
        verbose_name = '수강신청'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "<{user_name}> Enrolled on <{course_name}>".format(
            user_name=self.user.name,
            course_name=self.course.name,
        )
