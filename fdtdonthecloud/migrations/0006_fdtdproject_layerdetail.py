# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django_pgjson.fields


class Migration(migrations.Migration):

    dependencies = [
        ('fdtdonthecloud', '0005_auto_20150608_0126'),
    ]

    operations = [
        migrations.AddField(
            model_name='fdtdproject',
            name='layerdetail',
            field=django_pgjson.fields.JsonField(default='{}'),
        ),
    ]
