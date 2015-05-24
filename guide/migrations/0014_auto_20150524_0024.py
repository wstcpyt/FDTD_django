# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0013_auto_20150523_2357'),
    ]

    operations = [
        migrations.AlterField(
            model_name='releasenote',
            name='type',
            field=models.CharField(default='NEW', max_length=10, choices=[('NEW', 'NEW'), ('CHANGED', 'CHANGED')]),
        ),
    ]
