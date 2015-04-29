from behave import *
use_step_matcher("re")


@when("Click the tab_002 in the header")
def step_impl(context):
    tab_002 = context.browser.find_element_by_id('tab_002')
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
    tab_001 = context.browser.find_element_by_id('tab_001')
    tab_001.click()


@when("Click goto FDTD INDEX")
def step_impl(context):
    gotoFDTDINDEX = context.browser.find_element_by_id('gotoFDTDINDEX')
    gotoFDTDINDEX.click()


@then("see the title is INDEXApp")
def step_impl(context):
    assert 'INDEXApp' in context.browser.title