__author__ = 'yutongpang'
from django.test import TestCase
from fdtdonthecloud.models import FDTDProject
from django.contrib.auth.models import User


def create_user():
    user = User()
    user.username = 'TESTUSERNAME'
    user.email = 'TEST@EXAMPLE.COM'
    user.password = 'TESTPASSWORD'
    user.save()
    return user


class FDTDProjectModelTest(TestCase):
    def test_saving_and_retrieving_items(self):
        user = create_user()
        fdtdproject = FDTDProject()
        fdtdproject.user = user
        fdtdproject.title = "TEST TITLE"
        fdtdproject.save()
        first_item = FDTDProject.objects.filter(user=user).first()
        self.assertEqual(first_item.title, 'TEST TITLE')

