__author__ = 'yutongpang'
from .base import FunctionalTest
from refractiveindexdatabase.models import Element, Category
import time


class RefractivedirectoryTEST(FunctionalTest):
    def browser_link_to_databasedirectory(self):
        directory_page_url = self.server_url + '/databasedirectory/'
        self.browser.get(directory_page_url)
        self.wait_for_element_with_id('categoryselector')

    def test_refractive_directory_redirect(self):
        self.browser.get(self.server_url)
        self.wait_for_element_with_id('database')
        databasebutton = self.browser.find_element_by_id('database')
        databasebutton.click()
        self.wait_for_element_with_id('categoryselector')
        self.assertEqual('DatabaseDirectory', self.browser.title)

    def test_redirect_back_to_home_page(self):
        self.browser_link_to_databasedirectory()
        logobutton = self.browser.find_element_by_class_name('logo')
        logobutton.click()
        self.assertEqual('FDTD', self.browser.title)

    def test_category_selector_count(self):
        self.browser_link_to_databasedirectory()
        categoryselector = self.browser.find_element_by_id('categoryselector')
        categoryitems = categoryselector.find_elements_by_class_name('item')
        self.assertEqual(len(categoryitems), 1)

    def test_select_category_show_element_selector_and_show_right_element(self):
        self.browser_link_to_databasedirectory()
        categoryselector = self.browser.find_element_by_id('categoryselector')
        categoryitems = categoryselector.find_elements_by_class_name('item')
        categoryitems[0].click()
        self.wait_for_element_with_id('categorynext')
        self.browser.find_element_by_id('categorynext').click()
        self.wait_for_element_with_id('elementselector')
        elementselector = self.browser.find_element_by_id('elementselector')
        elementitems = elementselector.find_elements_by_class_name('item')
        self.assertEquals(len(elementitems), 1)