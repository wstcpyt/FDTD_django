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


@when("Customer login")
def step_impl(context):
    username = EXAMPLEUSERNAME
    create_pre_authenticated_session(context, username)
    context.browser.get(context.server_url)


@then("User already login")
def step_impl(context):
    wait_to_be_logged_in(context)


@then("Customer logout")
def step_impl(context):
    context.browser.get(context.server_url + '/logout/')


@when("Click goto Guide Page")
def step_impl(context):
    gotoguidebutton = context.browser.find_element_by_id('id_guide')
    gotoguidebutton.click()


@when("Click get started button")
def step_impl(context):
    getstartedbutton = context.browser.find_element_by_id('id_get_started')
    getstartedbutton.click()


@then("see the title FDTD App")
def step_impl(context):
    title = context.browser.title
    assert 'FDTD App' in title
