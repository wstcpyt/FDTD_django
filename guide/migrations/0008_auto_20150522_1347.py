# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0007_auto_20150522_1344'),
    ]

    operations = [
        migrations.AlterField(
            model_name='releasenote',
            name='type',
            field=models.CharField(choices=[(('NW',), 'NEW'), ('UP', 'UPDATE')], max_length=2, default=('NW',)),
        ),
    ]
