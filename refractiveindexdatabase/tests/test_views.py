__author__ = 'yutongpang'
from django.test import TestCase
from django.core.urlresolvers import resolve
from refractiveindexdatabase.views import database_directory_page, Elementitems, ElementListItems, \
    ElementListItemsDetail, identify_url_space, index_app_page
from refractiveindexdatabase.models import Category, Element, Elementlist


class DatabaseDirectoryTest(TestCase):
    def test_url_resolves_to_database_directory_page_view(self):
        found = resolve('/databasedirectory/')
        self.assertEqual(found.func, database_directory_page)

    def test_database_directory_page_return_correct_html(self):
        response = self.client.get('/databasedirectory/')
        self.assertTemplateUsed(response, 'database_directory.html')
        self.assertEquals(response.context['tabindex'], 1)


class IndexAppTest(TestCase):
    def test_url_resolves_to_index_app_page_view(self):
        found = resolve('/indexapp/')
        self.assertEqual(found.func, index_app_page)

    def test_index_app_page_return_correct_html(self):
        response = self.client.get('/indexapp/')
        self.assertTemplateUsed(response, 'indexapp.html')

class ElementItemsTEST(TestCase):
    def setUp(self):
        self.elementitems = Elementitems()
        Category.objects.create(title='main')
        category = Category.objects.filter(title='main').first()
        Element.objects.create(category=category, title='Ag')

    def test_url_resolves_to_elementitems(self):
        found = resolve('/elementitems/main/')
        self.assertEqual(found._func_path, 'refractiveindexdatabase.views.Elementitems')

    def test_elementitems_return_json_response(self):
        response = self.client.get('/elementitems/main/')
        self.assertEqual(response.content, b'[{"title":"Ag"}]')

    def test_identify_url_space(self):
        self.assertEqual(identify_url_space('a%20b'), 'a b')

    def test_get_category_return_one_category(self):
        self.assertEqual(self.elementitems._get_category('main').title, 'main')

    def test_get_elementitems(self):
        self.assertEqual(self.elementitems._get_elementlist('main')[0].title, 'Ag')

    def test_get_all_element(self):
        response = self.client.get('/elementitems/all/')
        self.assertEqual(response.content, b'[{"title":"Ag"}]')

class ElementListItemsTest(TestCase):
    def setUp(self):
        self.elementlistitems = ElementListItems()
        Category.objects.create(title='main')
        category = Category.objects.filter(title='main').first()
        Element.objects.create(category=category, title='Ag')
        element = Element.objects.filter(title='Ag').first()
        Elementlist.objects.create(element=element, title='peter')

    def test_url_resolves_to_elementlistitems(self):
        found = resolve('/elementlistitems/Ag/')
        self.assertEqual(found._func_path, 'refractiveindexdatabase.views.ElementListItems')

    def test_get_element_return_one_element(self):
        self.assertEqual(self.elementlistitems._get_element('Ag').title, 'Ag')

    def test_get_elementlistitems(self):
        self.assertEqual(self.elementlistitems._get_elementlistitems('Ag')[0].title, 'peter')

    def test_elementlistitems_return_json_response(self):
        response = self.client.get('/elementlistitems/Ag/')
        self.assertIn(b'peter', response.content)


class ElementListItemsDetailTest(TestCase):
    def setUp(self):
        self.elementlistitemsdetail = ElementListItemsDetail()
        Category.objects.create(title='main')
        category = Category.objects.filter(title='main').first()
        Element.objects.create(category=category, title='Ag')
        element = Element.objects.filter(title='Ag').first()
        Elementlist.objects.create(element=element, title='peter', datalink='https://refractiveindex.s3.amazonaws.com/253da551-dc13-4a23-aa91-c3b76067f875')

    def test_url_resolve_to_elementlistitemsdetial(self):
        found = resolve('/elementlistitemsdetail/1/')
        self.assertEquals(found._func_path, 'refractiveindexdatabase.views.ElementListItemsDetail')

    def test_get_elementlistitemsdetail(self):
        elementlist = Elementlist.objects.all()
        pk = elementlist[0].id
        elementlistitemsdeatial = self.elementlistitemsdetail._get_elementlistitemsdetail(pk)
        self.assertEquals(elementlistitemsdeatial.title, 'peter')

    def test_read_yaml_file_from_url(self):
        result = self.elementlistitemsdetail._read_yaml_file_from_url('https://refractiveindex.s3.amazonaws.com/253da551-dc13-4a23-aa91-c3b76067f875')
        self.assertIn('REFERENCES', result)

    def test_return_json_response(self):
        elementlist = Elementlist.objects.all()
        pk = elementlist[0].id
        response = self.client.get('/elementlistitemsdetail/' + str(pk) + '/')
        self.assertIn(b'REFERENCES', response.content)
        self.assertIn(b'ELEMENT', response.content)
        self.assertIn(b'PAPER', response.content)