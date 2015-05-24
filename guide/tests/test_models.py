__author__ = 'yutongpang'
from django.test import TestCase
from guide.models import ReleaseNote, ReleaseVersion
from datetime import datetime


def create_releaseversion():
    first_release_version = ReleaseVersion()
    first_release_version.version = '0.1.0'
    first_release_version.time = datetime.now()
    first_release_version.save()
    saved_items = ReleaseVersion.objects.all()
    first_saved_items = saved_items[0]
    return first_saved_items


class ReleaseVersionTEST(TestCase):
    def test_saving_and_tetrieving_items(self):
        first_saved_item = create_releaseversion()
        self.assertEqual(first_saved_item.version, '0.1.0')


class ReleaseNoteTEST(TestCase):
    def create_releasenote_items(self):
        self.releaseversion = create_releaseversion()
        first_releasenote = ReleaseNote()
        first_releasenote.releaseVersion = self.releaseversion
        first_releasenote.type = 'NW'
        first_releasenote.note = 'TEST'
        first_releasenote.save()
        return ReleaseNote.objects.all()

    def test_saving_and_retrieving_items(self):
        saved_items = self.create_releasenote_items()
        self.assertEquals(saved_items.count(), 1)
        first_saved_releasenote = saved_items[0]
        self.assertEquals(first_saved_releasenote.type, 'NW')
        self.assertEquals(first_saved_releasenote.note, 'TEST')
        self.assertEquals(first_saved_releasenote.releaseVersion, self.releaseversion)
