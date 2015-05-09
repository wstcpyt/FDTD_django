"""
WSGI config for FDTD_django project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/howto/deployment/wsgi/
"""

import os
import newrelic.agent
from django.core.wsgi import get_wsgi_application
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "FDTD_django.settings")
newrelic_root = os.path.join(BASE_DIR, 'newrelic.ini')
newrelic.agent.initialize(newrelic_root)
application = get_wsgi_application()
application = newrelic.agent.wsgi_application()(application)