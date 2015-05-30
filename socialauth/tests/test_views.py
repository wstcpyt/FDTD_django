from django.test import TestCase
from django.core.urlresolvers import resolve
from socialauth.views import login, logout


class Login(TestCase):
    def test_url_resolve(self):
        found = resolve('/login/')
        self.assertEqual(found.func, login)

    def test_render_correct_html(self):
        response = self.client.get('/login/')
        self.assertTemplateUsed(response, 'login.html')


class Logout(TestCase):
    def test_url_resolve(self):
        found = resolve('/logout/')
        self.assertEqual(found.func, logout)

    def test_redirect(self):
        response = self.client.get('/logout/')
        self.assertRedirects(response, '/')
