__author__ = 'yutongpang'
from selenium import webdriver
from django.contrib.staticfiles.testing import StaticLiveServerTestCase
from selenium.webdriver.support.ui import WebDriverWait
import sys
from refractiveindexdatabase.models import Category, Element


class FunctionalTest(StaticLiveServerTestCase):
    @classmethod
    def setUpClass(cls):
        for arg in sys.argv:
            if 'liveserver' in arg:
                cls.server_url = 'http://' + arg.split('=')[1]
                return
        super().setUpClass()
        cls.server_url = cls.live_server_url

    @classmethod
    def tearDownClass(cls):
        if cls.server_url == cls.live_server_url:
            super().tearDownClass()

    def setUp(self):
        self.browser = webdriver.Chrome('/Users/yutongpang/Documents/chrome/chromedriver')
        self.browser.implicitly_wait(3)
        Category.objects.create(title='main')
        category = Category.objects.filter(title='main').first()
        Element.objects.create(category=category, title='Ag')

    def tearDown(self):
        self.browser.quit()

    def wait_for_element_with_id(self, element_id):
        WebDriverWait(self.browser, timeout=30).until(
            lambda b: b.find_element_by_id(element_id),
            'Could not find element with id {}. Page text was:\n{}'.format(
                element_id, self.browser.find_element_by_tag_name('body').text
            )
        )