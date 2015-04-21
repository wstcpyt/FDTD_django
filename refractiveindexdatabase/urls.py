from django.conf.urls import url
from rest_framework.urlpatterns import format_suffix_patterns
from refractiveindexdatabase import views
urlpatterns = [
    url(r'^databasedirectory/$', views.database_directory_page, name='databasedir'),
    url(r'^elementitems/(?P<categoryname>[\w|\W]+)$', views.Elementitems.as_view(), name='elementlist'), #allow space
    url(r'^elementlistitems/(?P<elementname>[\w|\W]+)$', views.ElementListItems.as_view(), name='elementlistitems') #allow space
]

urlpatterns = format_suffix_patterns(urlpatterns)