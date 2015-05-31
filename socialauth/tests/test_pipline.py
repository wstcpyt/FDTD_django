__author__ = 'yutongpang'
from django.test import TestCase
from unittest.mock import patch
from socialauth.models import Customer
from django.contrib.auth.models import User
from socialauth.pipeline import checkcustomerexsit, createnewcustomer, create_customer_profile
from django.conf import settings
from social.backends.twitter import TwitterOAuth


def create_user():
    user = User()
    user.username = 'TESTUSERNAME'
    user.email = 'TEST@EXAMPLE.COM'
    user.password = 'TESTPASSWORD'
    user.save()
    return user


def create_customer():
    user = create_user()
    customer = Customer()
    customer.user = user
    customer.avatar = 'TESTAVATAR'
    customer.save()
    return user


class CheckcustomerexsitTest(TestCase):
    def test_checkcustomerdoesexsit(self):
        user = create_customer()
        customerexist = checkcustomerexsit(user)
        self.assertEqual(customerexist, True)

    def test_checkcustomernotexsit(self):
        user = create_user()
        customerexist = checkcustomerexsit(user)
        self.assertEqual(customerexist, False)


class CreateNewCustomerTEST(TestCase):
    def test_createnewcustomer(self):
        user = create_user()
        createnewcustomer(user, 'TESTAVATAR')
        customer = Customer.objects.first()
        self.assertEqual(customer.avatar, 'TESTAVATAR')

