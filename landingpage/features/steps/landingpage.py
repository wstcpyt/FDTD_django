from behave import *
from django.conf import settings
use_step_matcher("re")
from django.contrib.auth import BACKEND_SESSION_KEY, SESSION_KEY, HASH_SESSION_KEY, get_user_model
from django.contrib.sessions.backends.db import SessionStore
from landingpage.features.steps.refractiveindexdatabase import wait_for_element_with_id
User = get_user_model()
EXAMPLEUSERNAME = 'EXAMPLEUSERNAME'


def wait_to_be_logged_in(context):
    wait_for_element_with_id(context, 'id_logout')
    username = context.browser.find_element_by_id('id_logout').text
    return username


def wait_to_be_logged_out(context):
    wait_for_element_with_id(context, 'signinbutton')
    signintext = context.browser.find_element_by_id('signinbutton').text
    return signintext


def create_pre_authenticated_session(context, username):
    user = User.objects.create(email='edith@example.com', username=username, password='TESTPASSWORD')
    session = SessionStore()
    session[SESSION_KEY] = user.pk
    session[BACKEND_SESSION_KEY] = settings.AUTHENTICATION_BACKENDS[0]
    session[HASH_SESSION_KEY] = user.get_session_auth_hash()
    session.save()
    context.browser.get(context.server_url + "/404_no_such_url/")
    context.browser.add_cookie(dict(
        name=settings.SESSION_COOKIE_NAME,
        value=session.session_key,
        path='/',
    ))


@given("Customer come to Landing Page without login")
def step_impl(context):
    context.browser.get(context.server_url)


@then("see the title is FDTD")
def step_impl(context):
    title = context.browser.title
    assert 'FDTD' in title


@when("Click the SignIn Button")
def step_impl(context):
    loginbutton = context.browser.find_element_by_id('signinbutton')
    loginbutton.click()


@then("see the title is SignIn")
def step_impl(context):
    assert 'SignIn' in context.browser.title


@then("See the login button")
def step_impl(context):
    signintext = wait_to_be_logged_out(context)
    assert 'SIGN IN' in signintext


@when("Customer login")
def step_impl(context):
    username = EXAMPLEUSERNAME
    create_pre_authenticated_session(context, username)
    context.browser.get(context.server_url)


@then("See the username in toolbar")
def step_impl(context):
    toolbar_username = wait_to_be_logged_in(context)
    assert toolbar_username in EXAMPLEUSERNAME


@then("Customer logout")
def step_impl(context):
    context.browser.get(context.server_url + '/logout/')
