from behave import *
import time
from selenium.webdriver.support.ui import WebDriverWait
use_step_matcher("re")


def wait_for_element_with_id(self, element_id):
    WebDriverWait(self.browser, timeout=30).until(
        lambda b: b.find_element_by_id(element_id),
        'Could not find element with id {}. Page text was:\n{}'.format(
            element_id, self.browser.find_element_by_tag_name('body').text
        )
    )


def wait_for_element_with_class_name(context, element_class):
    WebDriverWait(context.browser, timeout=30).until(
        lambda b: b.find_element_by_class_name(element_class),
        'Could not find element with class {}. Page text was:\n{}'.format(
            element_class, context.browser.find_element_by_tag_name('body').text
        )
    )


def wait_for_element_with_tag_name(context, element_tag):
    WebDriverWait(context.browser, timeout=30).until(
        lambda b: b.find_element_by_tag_name(element_tag),
        'Could not find element with tag {}. Page text was:\n{}'.format(
            element_tag, context.browser.find_element_by_tag_name('body').text
        )
    )


@when("Click the tab_002 in the header")
def step_impl(context):
    tab_002 = context.browser.find_elements_by_xpath('//md-tab-item')[1]
    print(tab_002)
    tab_002.click()


@then("see the title is DatabaseDirectory")
def step_impl(context):
    assert 'DatabaseDirectory' in context.browser.title


@given("Customer come to the refractive index landing page")
def step_impl(context):
    refractive_index_database_url = context.server_url + '/databasedirectory/'
    context.browser.get(refractive_index_database_url)


@when("Click the tab_001 in the header")
def step_impl(context):
    tab_001 = context.browser.find_elements_by_xpath('//md-tab-item')[0]
    tab_001.click()


@when("Click goto FDTD INDEX")
def step_impl(context):
    gotoFDTDINDEX = context.browser.find_element_by_id('gotoFDTDINDEX')
    gotoFDTDINDEX.click()


@then("see the title is INDEXApp")
def step_impl(context):
    assert 'INDEXApp' in context.browser.title


@given("Customer on index app page")
def step_impl(context):
    index_app_page_url = context.server_url + '/indexapp/'
    context.browser.get(index_app_page_url)


@when("search an element")
def step_impl(context):
    searcharea = context.browser.find_element_by_tag_name('input')
    searcharea.send_keys('a')
    wait_for_element_with_class_name(context, 'searchspan')
    searchspan = context.browser.find_element_by_class_name('searchspan')
    searchspan.click()


@step("see the element list")
def step_impl(context):
    elementlisttitle = context.browser.find_element_by_id('elementlisttitle')
    assert elementlisttitle.text == 'peter'


@step("click the first elementlist")
def step_impl(context):
    elementlisttitle = context.browser.find_element_by_id('elementlisttitle')
    elementlisttitle.click()


@then("see the google chart svg")
def step_impl(context):
    wait_for_element_with_tag_name(context, 'svg')
