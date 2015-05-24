from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    # Examples:
    url(r'^$', 'landingpage.views.home_page', name='home'),
    url(r'^', include('refractiveindexdatabase.urls')),
    url(r'^', include('guide.urls')),
    url(r'^admin/', include(admin.site.urls)),
]
