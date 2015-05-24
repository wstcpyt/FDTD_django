from django.db import models


class ReleaseVersion(models.Model):
    version = models.CharField(max_length=200, unique=True)
    time = models.DateField()

    class Meta:
        ordering = ["time"]


class ReleaseNote(models.Model):
    NEW = 'NEW'
    CHANGED = 'CHANGED'
    DEV = 'DEV'
    ISSUES = 'ISSUES'
    FIXED = 'FIXED'
    TYPE_CHOICES = (
        (NEW, "NEW"),
        (CHANGED, "CHANGED"),
        (DEV, "DEV"),
        (ISSUES, "ISSUES"),
        (FIXED, "FIXED")
    )
    releaseVersion = models.ForeignKey(ReleaseVersion, default=None, related_name='releasenotes')
    type = models.CharField(max_length=10, choices=TYPE_CHOICES, default=NEW)
    note = models.TextField(default='')

    class Meta:
        ordering = ["-type"]

