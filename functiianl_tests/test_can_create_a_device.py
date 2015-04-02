__author__ = 'yutongpang'
from .base import FunctionalTest


class NewvistorTest(FunctionalTest):
    def test_can_create_a_device(self):
        self.browser.get('http://localhost:8000')
        self.assertIn('Django', self.browser.title)