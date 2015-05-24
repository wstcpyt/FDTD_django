__author__ = 'yutongpang'
from django.test import TestCase
from django.core.urlresolvers import resolve
from guide.views import guide_page
from guide.models import ReleaseVersion, ReleaseNote


class GuidePageTest(TestCase):
    def test_root_url_resolves_to_home_page_view(self):
        found = resolve('/guide/')
        self.assertEqual(found.func, guide_page)

    def test_home_page_return_correct_html(self):
        response = self.client.get('/guide/')
        self.assertTemplateUsed(response, 'guide_page.html')


class ReleaseVersionTest(TestCase):
    def setUp(self):
        releaseversion = ReleaseVersion()
        releaseversion.version = '0.1.0'
        from datetime import datetime
        releaseversion.time = datetime.now()
        releaseversion.save()
        first_releaseversion = ReleaseVersion.objects.first()
        releasenote = ReleaseNote()
        releasenote.releaseVersion = first_releaseversion
        releasenote.type = 'NW'
        releasenote.note = 'Test'
        releasenote.save()

    def test_url_resolve_to_releaseversions(self):
        found = resolve('/releaseversions/')
        self.assertEquals(found._func_path, 'guide.views.Releaseversions')

    def test_releaseversions_return_json_response(self):
        response = self.client.get('/releaseversions/')
        self.assertIn(b'version":"0.1.0', response.content)
