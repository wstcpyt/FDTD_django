from django.db import models
from django.contrib.auth.models import User


class FDTDProject(models.Model):
    category = models.ForeignKey(User, default=None)
    title = models.TextField(unique=True)