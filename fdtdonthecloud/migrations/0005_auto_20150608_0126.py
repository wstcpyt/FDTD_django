# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fdtdonthecloud', '0004_fdtdproject_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fdtdproject',
            name='title',
            field=models.CharField(max_length=200),
        ),
    ]
