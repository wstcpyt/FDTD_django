from django.test import TestCase
from fdtdonthecloud.views import fdtdapp
from django.core.urlresolvers import resolve


class FDTDAppTEST(TestCase):
    def test_url_resolve(self):
        found = resolve('/fdtdapp/')
        self.assertEquals(found.func, fdtdapp)

    def test_url_render(self):
        response = self.client.get('/fdtdapp/')
        self.assertTemplateUsed(response, 'fdtdapp.html')