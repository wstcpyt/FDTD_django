from behave import *

use_step_matcher("re")

@given("Customer come to guide page")
def step_impl(context):
    guide_page_url = context.server_url + '/guide/'
    context.browser.get(guide_page_url)