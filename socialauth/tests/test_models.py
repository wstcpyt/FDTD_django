from django.test import TestCase
from socialauth.models import Customer
from django.contrib.auth.models import User

def create_customer():
    user = User()
    user.username = 'TESTUSERNAME'
    user.email = 'TEST@EXAMPLE.COM'
    user.password = 'TESTPASSWORD'
    user.save()
    customer = Customer()
    customer.user = user
    customer.avatar = 'TESTAVATAR'
    customer.save()


class CustomerModelTest(TestCase):
    def test_create_and_query_customer(self):
        create_customer()
        customer = Customer.objects.first()
        self.assertEqual(customer.avatar, 'TESTAVATAR')
