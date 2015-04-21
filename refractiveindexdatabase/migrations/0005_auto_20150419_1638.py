# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('refractiveindexdatabase', '0004_elementlist'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='elementlist',
            name='bottomrange',
        ),
        migrations.RemoveField(
            model_name='elementlist',
            name='toprange',
        ),
    ]
