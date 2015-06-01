__author__ = 'yutongpang'
from django.test import TestCase
from django.core.urlresolvers import resolve
from refractiveindexdatabase.views import Elementitems, ElementListItems, \
    ElementListItemsDetail, identify_url_space, index_app_page, AllMaterial
from refractiveindexdatabase.models import Category, Element, Elementlist


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
        Elementlist.objects.create(element=element, title='peter')

    def test_url_resolve_to_elementlistitemsdetial(self):
        found = resolve('/elementlistitemsdetail/1/')
        self.assertEquals(found._func_path, 'refractiveindexdatabase.views.ElementListItemsDetail')

    def test_get_elementlistitemsdetail(self):
        elementlist = Elementlist.objects.all()
        pk = elementlist[0].id
        elementlistitemsdeatial = self.elementlistitemsdetail._get_elementlistitemsdetail(pk)
        self.assertEquals(elementlistitemsdeatial.title, 'peter')

    def test_return_json_response(self):
        elementlist = Elementlist.objects.all()
        pk = elementlist[0].id
        response = self.client.get('/elementlistitemsdetail/' + str(pk) + '/')
        self.assertIn(b'ELEMENT', response.content)
        self.assertIn(b'PAPER', response.content)


class AllMaterialTest(TestCase):
    def setUp(self):
        Category.objects.create(title='main')
        category = Category.objects.filter(title='main').first()
        Element.objects.create(category=category, title='Ag')
        Element.objects.create(category=category, title='Au')
        Element.objects.create(category=category, title='Cu')
        Element.objects.create(category=category, title='Fe')

    def test_url_resolve(self):
        found = resolve('/allmaterial/0/10/')
        self.assertEquals(found._func_path, 'refractiveindexdatabase.views.AllMaterial')

    def test_get_material_inrange(self):
        self.allMaterial = AllMaterial()
        materials_inrange_1 = self.allMaterial._get_material_inrange(0, 2)
        self.assertEquals(materials_inrange_1[0].title, 'Ag')
        self.assertEquals(materials_inrange_1[1].title, 'Au')
        materials_inrange_2 = self.allMaterial._get_material_inrange(1, 2)
        self.assertEquals(materials_inrange_2[0].title, 'Au')
        self.assertEquals(materials_inrange_2[1].title, 'Cu')

    def test_return_json_response(self):
        response = self.client.get('/allmaterial/0/2/')
        self.assertIn(b'title', response.content)
