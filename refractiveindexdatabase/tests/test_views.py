__author__ = 'yutongpang'
from django.test import TestCase
from django.core.urlresolvers import resolve
from refractiveindexdatabase.views import database_directory_page, ElementList
from refractiveindexdatabase.models import Category, Element


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


class ElementListTEST(TestCase):
    def setUp(self):
        self.elementlist = ElementList()
        Category.objects.create(title='main')
        category = Category.objects.filter(title='main').first()
        Element.objects.create(category=category, title='Ag')

    def test_url_resolves_to_elementlist(self):
        found = resolve('/elementlist/main')
        self.assertEqual(found._func_path, 'refractiveindexdatabase.views.ElementList')

    def test_elementlist_return_json_response(self):
        response = self.client.get('/elementlist/main')
        self.assertEqual(response.content, b'[{"id":2,"category":6,"title":"Ag"}]')

    def test_identify_url_space(self):
        self.assertEqual(self.elementlist._identify_url_space('a%20b'), 'a b')

    def test_get_category_return_one_category(self):
        self.assertEqual(self.elementlist._get_category('main').title, 'main')

    def test_get_elementlist(self):
        self.assertEqual(self.elementlist._get_elementlist('main')[0].title, 'Ag')




