from django.test import TestCase
from fdtdonthecloud.views import fdtdapp
from django.core.urlresolvers import resolve
from fdtdonthecloud.views import FDTDProjectView
from django.http import QueryDict
from django.contrib.auth.models import User
from fdtdonthecloud.models import FDTDProject


class FDTDAppTEST(TestCase):
    def setUp(self):
        self.user = User.objects.create_user('test', 'test@example.com', 'testpassword')

    def test_url_resolve(self):
        found = resolve('/fdtdapp/')
        self.assertEquals(found.func, fdtdapp)

    def test_url_render(self):
        self.client.login(username='test', password='testpassword')
        response = self.client.get('/fdtdapp/')
        self.assertTemplateUsed(response, 'fdtdapp.html')


def createuser():
    user = User.objects.create(username='user', password='testpassword')
    return user

class Requesttestclass():
    def __init__(self):
        self.data = {"title": "testtitle"}
        self.user = createuser()

class RequesttestQueryDictclass():
    def __init__(self):
        self.data = QueryDict('title=testtitle')


class FDTDProjectViewTEST(TestCase):
    def setUp(self):
        self.fdtdProjectView = FDTDProjectView()

    def test_getQuerydata_simplejson(self):
        request = Requesttestclass()
        querydata = self.fdtdProjectView._getQuerydata(request)
        self.assertEqual(querydata['title'], 'testtitle')

    def test_getQuerydata_QueryDict(self):
        request = RequesttestQueryDictclass()
        querydata = self.fdtdProjectView._getQuerydata(request)
        self.assertEqual(querydata['title'], 'testtitle')

    def test_post_create_database_instance(self):
        request = Requesttestclass()
        response = self.fdtdProjectView.post(request)
        self.assertEqual(response.status_code, 201)
        first_item = FDTDProject.objects.first()
        self.assertEquals(first_item.title, 'testtitle')

