__author__ = 'yutongpang'
from django.test import TestCase
from refractiveindexdatabase.models import Category, Element


def create_category_item():
    first_category = Category()
    first_category.title = 'main'
    first_category.save()
    saved_items = Category.objects.all()
    first_saved_item = saved_items[0]
    return first_saved_item


class CategoryModelTest(TestCase):
    def test_saving_and_retrieving_items(self):
        first_saved_item = create_category_item()
        self.assertEqual(first_saved_item.title, 'main')


class ElementModelTest(TestCase):
    def create_element_items(self):
        self.category_items = create_category_item()
        first_element = Element()
        first_element.title = 'Ag'
        first_element.category = self.category_items
        first_element.save()
        return Element.objects.all()

    def test_saving_and_retrieving_items(self):
        saved_items = self.create_element_items()
        self.assertEqual(saved_items.count(), 1)
        first_saved_element = saved_items[0]
        self.assertEqual(first_saved_element.title, 'Ag')
        self.assertEqual(first_saved_element.category, self.category_items)
