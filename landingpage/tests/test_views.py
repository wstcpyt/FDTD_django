__author__ = 'yutongpang'
from django.test import TestCase
from django.core.urlresolvers import resolve
from landingpage.views import home_page


class HomePageTest(TestCase):
    def test_root_url_resolves_to_home_page_view(self):
        found = resolve('/')
        self.assertEqual(found.func, home_page)

    def test_home_page_return_correct_html(self):
        response = self.client.get('/')
        self.assertTemplateUsed(response, 'home_page.html')