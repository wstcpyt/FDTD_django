from selenium import webdriver
from refractiveindexdatabase.models import Category, Element, Elementlist


def init_test_database_data():
    Category.objects.create(title='main')
    category = Category.objects.filter(title='main').first()
    Element.objects.create(category=category, title='Ag')
    element = Element.objects.filter(title='Ag').first()
    Elementlist.objects.create(element=element, title='peter')


def before_all(context):
    context.server_url = 'http://localhost:8081'
    context.browser = webdriver.Chrome('/Users/yutongpang/Documents/chrome/chromedriver')
    context.browser.implicitly_wait(3)
    init_test_database_data()


def after_all(context):
    context.browser.quit()