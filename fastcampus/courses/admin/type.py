from django.contrib import admin

from courses.models import Type


@admin.register(Type)
class TypeModelAdmin(admin.ModelAdmin):
    list_display = admin.ModelAdmin.list_display + (
        'name',
        'slug',
    )

    list_filter = admin.ModelAdmin.list_filter + (
    )

    inlines = (
    )

    search_fields = (
        'name',
        'slug',
    )

    readonly_fields = (
    )
