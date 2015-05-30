from django.conf.urls import url, include
from rest_framework.urlpatterns import format_suffix_patterns
urlpatterns = [
    url('', include('social.apps.django_app.urls', namespace='social')),
    url(r'^logout/$', 'socialauth.views.logout', name='logout'),
    url(r'^login/$', 'socialauth.views.login', name='login'),
]

urlpatterns = format_suffix_patterns(urlpatterns)