# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0006_auto_20150522_1339'),
    ]

    operations = [
        migrations.AlterField(
            model_name='releasenote',
            name='type',
            field=models.CharField(choices=[(('NEW',), 'NEW'), ('UPDATE', 'UPDATE')], default=('NEW',), max_length=200),
        ),
    ]
