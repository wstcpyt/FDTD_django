from django.conf.urls import url
from rest_framework.urlpatterns import format_suffix_patterns
from guide import views
urlpatterns = [
    url(r'^guide/$', views.guide_page, name='guide'),
]
urlpatterns = format_suffix_patterns(urlpatterns)