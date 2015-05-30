from django.conf.urls import url, include
from rest_framework.urlpatterns import format_suffix_patterns
urlpatterns = [
    url('', include('social.apps.django_app.urls', namespace='social')),
    url(r'^logout/$', 'socailauth.views.logout', name='logout'),
]

urlpatterns = format_suffix_patterns(urlpatterns)