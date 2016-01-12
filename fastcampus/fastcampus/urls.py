from django.conf.urls import url
from django.contrib import admin


admin.site.site_header = '패스트코스 관리자'

urlpatterns = [
    url(r'^', admin.site.urls),
]
