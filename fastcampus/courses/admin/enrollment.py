from django.contrib import admin

from courses.models import Enrollment


@admin.register(Enrollment)
class EnrollmentModelAdmin(admin.ModelAdmin):
    list_display = admin.ModelAdmin.list_display + (
        'user',
        'course',
    )

    list_filter = admin.ModelAdmin.list_filter + (
        'course',
    )

    inlines = (
    )

    search_fields = (
        'user__name',
        'course__name',
    )

    readonly_fields = (
        'user',
        'course',
    )
