from selenium import webdriver
from django.contrib.staticfiles.testing import StaticLiveServerTestCase


def before_scenario(context, scenario):
    context.browser = webdriver.Firefox()
    context.browser.implicitly_wait(3)


def after_scenario(context, scenario):
    context.browser.quit()