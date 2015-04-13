from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    # Examples:
    url(r'^$', 'landingpage.views.home_page', name='home'),
    url(r'^databasedirectory/$', 'refractiveindexdatabase.views.database_directory_page', name='databasedir'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
]
