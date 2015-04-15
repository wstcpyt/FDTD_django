__author__ = 'yutongpang'
from django.test import TestCase
from django.core.urlresolvers import resolve
from refractiveindexdatabase.views import database_directory_page
from refractiveindexdatabase.models import Category


class DatabaseDirectoryTest(TestCase):
    def setUp(self):
        Category.objects.create(title='main')

    def test_url_resolves_to_database_directory_page_view(self):
        found = resolve('/databasedirectory/')
        self.assertEqual(found.func, database_directory_page)

    def test_database_directory_page_return_correct_html(self):
        response = self.client.get('/databasedirectory/')
        self.assertTemplateUsed(response, 'database_directory.html')

    def test_database_directory_page_return_category_contents(self):
        response = self.client.get('/databasedirectory/')
        self.assertEqual(response.context['category'].count(), 1)
        self.assertEqual(response.context['category'][0].title, 'main')