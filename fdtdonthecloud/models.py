from django.db import models
from django.contrib.auth.models import User


class FDTDProject(models.Model):
    user = models.ForeignKey(User, default=None)
    title = models.CharField(max_length=200)