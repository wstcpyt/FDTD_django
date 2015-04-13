__author__ = 'yutongpang'
from django.test import TestCase
from django.core.urlresolvers import resolve
from refractiveindexdatabase.views import database_directory_page


class DatabaseDirectoryTest(TestCase):
    def test_url_resolves_to_database_directory_page_view(self):
        found = resolve('/databasedirectory/')
        self.assertEqual(found.func, database_directory_page)

    def test_database_directory_page_return_correct_html(self):
        response = self.client.get('/databasedirectory/')
        self.assertTemplateUsed(response, 'database_directory.html')