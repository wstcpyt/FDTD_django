from behave import *
import time
from selenium.webdriver.support.ui import WebDriverWait
use_step_matcher("re")


def wait_for_element_with_id(context, element_id):
    WebDriverWait(context.browser, timeout=30).until(
        lambda b: b.find_element_by_id(element_id),
        'Could not find element with id {}. Page text was:\n{}'.format(
            element_id, context.browser.find_element_by_tag_name('body').text
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


@when("Click the Indexnavbutton in the header")
def step_impl(context):
    Indexnavbutton = context.browser.find_element_by_id('Index')
    Indexnavbutton.click()

@then("see the title is DatabaseDirectory")
def step_impl(context):
    print(context.browser.title)
    assert 'DatabaseDirectory' in context.browser.title


@given("Customer come to the refractive index landing page")
def step_impl(context):
    refractive_index_database_url = context.server_url + '/databasedirectory/'
    context.browser.get(refractive_index_database_url)


@when("Click the FDTDnavbutton in the header")
def step_impl(context):
    FDTDnavbutton = context.browser.find_element_by_id('FDTD')
    FDTDnavbutton.click()


@when("Click goto FDTD INDEX")
def step_impl(context):
    wait_for_element_with_id(context, 'gotoFDTDINDEX')
    import time
    time.sleep(0.5)
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


@when("Click goto RESTAPI guide page")
def step_impl(context):
    import time
    time.sleep(0.5)
    gotoRESTAPIguide = context.browser.find_element_by_id('gotoGuide')
    gotoRESTAPIguide.click()


@then("see the title is Guide")
def step_impl(context):
    print(context.browser.title)
    assert 'Guide' in context.browser.title


@when("Click the gotoindexlandingpage button")
def step_impl(context):
    wait_for_element_with_id(context, 'gotoIndexlandingpage')
    gotoIndexlandingpage = context.browser.find_element_by_id('gotoIndexlandingpage')
    gotoIndexlandingpage.click()


@then("see the exportdata button")
def step_impl(context):
    wait_for_element_with_id(context, 'exportdata')
    exportdatabutton = context.browser.find_element_by_id('exportdata')
    exportdatabutton.click()

