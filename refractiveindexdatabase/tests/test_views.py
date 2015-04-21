__author__ = 'yutongpang'
from django.test import TestCase
from django.core.urlresolvers import resolve
from refractiveindexdatabase.views import database_directory_page, Elementitems, ElementListItems, identify_url_space
from refractiveindexdatabase.models import Category, Element, Elementlist


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


class ElementItemsTEST(TestCase):
    def setUp(self):
        self.elementitems = Elementitems()
        Category.objects.create(title='main')
        category = Category.objects.filter(title='main').first()
        Element.objects.create(category=category, title='Ag')

    def test_url_resolves_to_elementitems(self):
        found = resolve('/elementitems/main')
        self.assertEqual(found._func_path, 'refractiveindexdatabase.views.Elementitems')

    def test_elementitems_return_json_response(self):
        response = self.client.get('/elementitems/main')
        self.assertEqual(response.content, b'[{"title":"Ag"}]')

    def test_identify_url_space(self):
        self.assertEqual(identify_url_space('a%20b'), 'a b')

    def test_get_category_return_one_category(self):
        self.assertEqual(self.elementitems._get_category('main').title, 'main')

    def test_get_elementitems(self):
        self.assertEqual(self.elementitems._get_elementlist('main')[0].title, 'Ag')


class ElementListItemsTest(TestCase):
    def setUp(self):
        self.elementlistitems = ElementListItems()
        Category.objects.create(title='main')
        category = Category.objects.filter(title='main').first()
        Element.objects.create(category=category, title='Ag')
        element = Element.objects.filter(title='Ag').first()
        Elementlist.objects.create(element=element, title='peter')

    def test_url_resolves_to_elementlistitems(self):
        found = resolve('/elementlistitems/Ag')
        self.assertEqual(found._func_path, 'refractiveindexdatabase.views.ElementListItems')

    def test_get_element_return_one_element(self):
        self.assertEqual(self.elementlistitems._get_element('Ag').title, 'Ag')

    def test_get_elementlistitems(self):
        self.assertEqual(self.elementlistitems._get_elementlistitems('Ag')[0].title, 'peter')

    def test_elementlistitems_return_json_response(self):
        response = self.client.get('/elementlistitems/Ag')
        self.assertEqual(response.content, b'[{"title":"peter"}]')

