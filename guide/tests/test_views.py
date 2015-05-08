__author__ = 'yutongpang'
from django.test import TestCase
from django.core.urlresolvers import resolve
from guide.views import guide_page


class GuidePageTest(TestCase):
    def test_root_url_resolves_to_home_page_view(self):
        found = resolve('/guide/')
        self.assertEqual(found.func, guide_page)

    def test_home_page_return_correct_html(self):
        response = self.client.get('/guide/')
        self.assertTemplateUsed(response, 'guide_page.html')
