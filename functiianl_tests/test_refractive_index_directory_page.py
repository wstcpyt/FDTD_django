__author__ = 'yutongpang'
from .base import FunctionalTest

class RefractivedirectoryTEST(FunctionalTest):
    def test_refractive_directory_redirect(self):
        self.browser.get(self.server_url)
        self.wait_for_element_with_id('database')
        databasebutton = self.browser.find_element_by_id('database')
        databasebutton.click()
        self.wait_for_element_with_id('database')
        self.assertEqual('DatabaseDirectory', self.browser.title)

    def test_redirect_back_to_home_page(self):
        directory_page_url = self.server_url + '/databasedirectory/'
        self.browser.get(directory_page_url)
        self.wait_for_element_with_id('database')
        logobutton = self.browser.find_element_by_class_name('logo')
        logobutton.click()
        self.assertEqual('FDTD', self.browser.title)

    def test_category_selector_count(self):
        directory_page_url = self.server_url + '/databasedirectory/'
        self.browser.get(directory_page_url)
        self.wait_for_element_with_id('database')
        categoryselector = self.browser.find_elements_by_class_name('item')
        self.assertEqual(len(categoryselector), 1)

    def test_select_category_show_element_selector(self):
        directory_page_url = self.server_url + '/databasedirectory/'
        self.browser.get(directory_page_url)
        self.wait_for_element_with_id('database')
        self.browser.find_element_by_tag_name('peter-dropdown').click()
        categoryselector = self.browser.find_elements_by_class_name('item')
        categoryselector[0].click()
        self.wait_for_element_with_id('elementselector')
        self.browser.find_element_by_id('elementselector')
