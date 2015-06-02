from django.test import TestCase
from fdtdonthecloud.views import fdtdapp
from django.core.urlresolvers import resolve
from django.contrib.auth.models import User


class FDTDAppTEST(TestCase):
    def setUp(self):
        self.user = User.objects.create_user('test', 'test@example.com', 'testpassword')

    def test_url_resolve(self):
        found = resolve('/fdtdapp/')
        self.assertEquals(found.func, fdtdapp)

    def test_url_render(self):
        self.client.login(username='test', password='testpassword')
        response = self.client.get('/fdtdapp/')
        self.assertTemplateUsed(response, 'fdtdapp.html')
