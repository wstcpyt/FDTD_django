from django.db import models


class Category(models.Model):
    title = models.TextField()


class Element(models.Model):
    category = models.ForeignKey(Category, default=None)
    title = models.TextField()