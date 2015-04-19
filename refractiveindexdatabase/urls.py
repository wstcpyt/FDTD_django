from django.conf.urls import url
from rest_framework.urlpatterns import format_suffix_patterns
from refractiveindexdatabase import views
urlpatterns = [
    url(r'^databasedirectory/$', views.database_directory_page, name='databasedir'),
    url(r'^elementlist/(?P<categoryname>[\w|\W]+)$', views.ElementList.as_view(), name='elementlist') #allow space
]

urlpatterns = format_suffix_patterns(urlpatterns)