from django.contrib import admin

from managers.models import Manager


@admin.register(Manager)
class ManagerModelAdmin(admin.ModelAdmin):
    list_display = admin.ModelAdmin.list_display + (
        'name',
        'position',
        'gender',
        'age',
        'description',
    )

    list_filter = admin.ModelAdmin.list_filter + (
        'gender',
        'position',
    )

    inlines = (
    )

    search_fields = (
        'name',
        'position',
        'description',
    )

    readonly_fields = (
    )
