from selenium import webdriver
from refractiveindexdatabase.models import Category, Element, Elementlist


def init_test_database_data():
    Category.objects.create(title='main')
    category = Category.objects.filter(title='main').first()
    Element.objects.create(category=category, title='Ag')
    element = Element.objects.filter(title='Ag').first()
    Elementlist.objects.create(element=element, title='peter',
                               datalink='https://refractiveindex.s3.amazonaws.com/253da551-dc13-4a23-aa91-c3b76067f875')


def before_all(context):
    context.server_url = 'http://localhost:8081'
    context.browser = webdriver.Firefox()
    context.browser.implicitly_wait(3)
    init_test_database_data()


def after_all(context):
    context.browser.quit()