from behave import *
from refractiveindexdatabase.models import Category
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


@then("can interact with next button on category selection panel")
def step_impl(context):
    context.browser.find_element_by_id('categorynext').click()


@then("Category show the right number of items")
def step_impl(context):
    categoryselector = context.browser.find_element_by_id('categoryselector')
    categoryitems = categoryselector.find_elements_by_class_name('item')
    categpry = Category.objects.all()
    assert len(categpry) is 1