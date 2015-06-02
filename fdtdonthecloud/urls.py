from django.conf.urls import url
from rest_framework.urlpatterns import format_suffix_patterns
from fdtdonthecloud import views

urlpatterns = [
    url(r'^fdtdapp/$', views.fdtdapp, name='fdtdapp'),
]
urlpatterns = format_suffix_patterns(urlpatterns)
