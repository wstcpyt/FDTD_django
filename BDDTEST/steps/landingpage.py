from behave import *
use_step_matcher("re")
import unittest

@given("Customer come to Landing Page without login")
def step_impl(context):
    context.server_url = 'http://localhost:8000/'

@when("The Page Refresh")
def step_impl(context):
    context.browser.get(context.server_url)


@then("see the title is FDTD")
def step_impl(context):
    title = context.browser.title
    assert title in 'FDTD'