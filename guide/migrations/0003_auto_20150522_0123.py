# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0002_auto_20150522_0059'),
    ]

    operations = [
        migrations.AlterField(
            model_name='releaseversion',
            name='version',
            field=models.CharField(max_length=200, unique=True),
        ),
    ]
