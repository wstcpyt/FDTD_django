# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('refractiveindexdatabase', '0002_element'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='title',
            field=models.TextField(unique=True),
        ),
        migrations.AlterField(
            model_name='element',
            name='title',
            field=models.TextField(unique=True),
        ),
    ]
