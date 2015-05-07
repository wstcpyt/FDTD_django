__author__ = 'yutongpang'
from .base import FunctionalTest


class NewvistorTest(FunctionalTest):
    def test_new_visitor_come_to_landing_page(self):
        self.browser.get(self.server_url)
        self.assertIn('FDTD', self.browser.title)