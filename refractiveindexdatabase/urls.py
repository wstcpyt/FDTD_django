from django.conf.urls import url
from rest_framework.urlpatterns import format_suffix_patterns
from refractiveindexdatabase import views
urlpatterns = [
    url(r'^indexapp/$', views.index_app_page, name='indexapp'),
    url(r'^allmaterial/(?P<offset>[0-9]+)/(?P<number>[0-9]+)/$', views.AllMaterial.as_view(), name='allmaterial'),
    url(r'^elementitems/(?P<categoryname>[\w|\W]+)/$', views.Elementitems.as_view(), name='elementlist'),
    url(r'^elementlistitems/(?P<elementname>[\w|\W]+)/$', views.ElementListItems.as_view(), name='elementlistitems'),
    url(r'^elementlistitemsdetail/(?P<pk>[0-9]+)/$', views.ElementListItemsDetail.as_view(), name='elementlistitemsdetail')
]

urlpatterns = format_suffix_patterns(urlpatterns)