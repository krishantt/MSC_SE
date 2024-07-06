from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin
from django.urls import path
from django.views.generic import TemplateView

from college import views




urlpatterns = [
    path('', views.home, name='home'),
    path('admin/', admin.site.urls),
    url(r'^.*export.*$', views.exportform),
    url(r'^.*dumpteachers.*$', views.exportteachers, name='dumpteachers'),
    url(r'^.*dumpexperts.*$', views.exportexperts, name='dumpexperts'),
    url(r'^.*cloneyear.*$', views.cloneyear, name='cloneyear'),
    url(r'^.*about.*$', TemplateView.as_view(template_name='admin/about.html'), name='aboutsystem'),
    url(r'^.*docgen/', include(('thesis.urls', 'thesis'))),
    
]


if settings.DEBUG:
    import debug_toolbar
   
    urlpatterns = [
                      url(r'^__debug__/', include(debug_toolbar.urls)),
                  ] + urlpatterns
