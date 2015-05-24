# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0005_auto_20150522_1311'),
    ]

    operations = [
        migrations.AlterField(
            model_name='releasenote',
            name='type',
            field=models.CharField(default=('NW',), max_length=200, choices=[(('NW',), 'NEW'), ('UP', 'UPDATE')]),
        ),
    ]
