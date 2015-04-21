from selenium import webdriver
import os
os.environ['DJANGO_SETTINGS_MODULE'] = 'FDTD_django.settings'
from django.conf import settings
import django
from refractiveindexdatabase.models import Category


def before_all(context):
    from django.test.runner import DiscoverRunner
    context.runner = DiscoverRunner()
    django.setup()


def before_scenario(context, scenario):
    context.runner.setup_test_environment()
    context.old_db_config = context.runner.setup_databases()
    Category.objects.create(title='maintest')
    context.server_url = 'http://localhost:8000'
    context.browser = webdriver.Chrome('/Users/yutongpang/Documents/chrome/chromedriver')
    context.browser.implicitly_wait(3)


def after_scenario(context, scenario):
    context.browser.quit()
    context.runner.teardown_databases(context.old_db_config)
    context.runner.teardown_test_environment()


