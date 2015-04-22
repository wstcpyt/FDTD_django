from behave import *
use_step_matcher("re")


@when("Click the database button in the menu nav")
def step_impl(context):
    databasebutton = context.browser.find_element_by_id('database')
    databasebutton.click()


@then("see the title is DatabaseDirectory")
def step_impl(context):
    assert 'DatabaseDirectory' in context.browser.title


@given("Customer come to the refractive index database page")
def step_impl(context):
    refractive_index_database_url = context.server_url + '/databasedirectory/'
    context.browser.get(refractive_index_database_url)


@when("Click the logo button")
def step_impl(context):
    logobutton = context.browser.find_element_by_class_name('logo')
    logobutton.click()


@when("Choose the Category")
def step_impl(context):
    categoryselector = context.browser.find_element_by_id('categoryselector')
    categoryitems = categoryselector.find_elements_by_class_name('item')
    categoryitems[0].click()


@when("interact with next button on category selection panel")
def step_impl(context):
    context.browser.find_element_by_id('categorynext').click()


@then("Category show the right number of items")
def step_impl(context):
    categoryselector = context.browser.find_element_by_id('categoryselector')
    categoryitems = categoryselector.find_elements_by_class_name('item')
    assert len(categoryitems) is 1


@then("see the right number of element items")
def step_impl(context):
    elementselector = context.browser.find_element_by_id('elementselector')
    elementitems = elementselector.find_elements_by_class_name('item')
    assert len(elementitems) is 1


@step("Choose the Element")
def step_impl(context):
    elementselector = context.browser.find_element_by_id('elementselector')
    elementitems = elementselector.find_elements_by_class_name('item')
    elementitems[0].click()


@step("interact with the next button on element selection panel")
def step_impl(context):
    context.browser.find_element_by_id('elementnext').click()


@then("see the right number of elementlist items")
def step_impl(context):
    elementlistselector = context.browser.find_element_by_id('elementlistselector')
    elementlistitems = elementlistselector.find_elements_by_class_name('item')
    assert len(elementlistitems) is 1


@step("Pick a elementpage from the Elementlist")
def step_impl(context):
    elementlistselector = context.browser.find_element_by_id('elementlistselector')
    elementlistitems = elementlistselector.find_elements_by_class_name('item')
    elementlistitems[0].click()


@step("Interact with the done button on elementlist panel")
def step_impl(context):
    context.browser.find_element_by_id('elementlistnext').click()


@then("see the result panel")
def step_impl(context):
    result = context.browser.find_element_by_id('refractiveindexresult')
    result.click()


@step("See the refractive index chart")
def step_impl(context):
    chart = context.browser.find_element_by_id('refractiveindexchart')
    chart.click()