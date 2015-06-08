# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fdtdonthecloud', '0002_auto_20150607_0251'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='fdtdproject',
            name='user',
        ),
    ]
