from django.db import models


class Category(models.Model):
    title = models.TextField(unique=True)


class Element(models.Model):
    category = models.ForeignKey(Category, default=None)
    title = models.TextField(unique=True)


class Elementlist(models.Model):
    element = models.ForeignKey(Element, default=None)
    title = models.TextField()
    references = models.TextField(default='')
    comments = models.TextField(default='')
    type = models.TextField()
    datalink = models.TextField()

