from django.contrib import admin

from courses.models import Course


@admin.register(Course)
class CourseModelAdmin(admin.ModelAdmin):
    list_display = admin.ModelAdmin.list_display + (
        'name',
        'slug',
        'price',
    )

    list_filter = admin.ModelAdmin.list_filter + (
        'type',
    )

    inlines = (
    )

    search_fields = (
        'name',
        'slug',
    )

    readonly_fields = (
    )
