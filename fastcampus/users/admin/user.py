from django.conf import settings

from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DefaultUserAdmin

from users.models.user import User


@admin.register(User)
class UserModelAdmin(DefaultUserAdmin):
    list_display = admin.ModelAdmin.list_display + (
        'username',

        'name',
        'address',
        'age',
        'is_male',

        'date_joined',
        'date_called',
        'date_enrolled',

        'email',

        'phonenumber',
        'phonenumber_preprocessed',
    )

    list_filter = DefaultUserAdmin.list_filter + (
        'is_male',
    )

    search_fields = DefaultUserAdmin.search_fields + (
        'name',
        'address',
    )
