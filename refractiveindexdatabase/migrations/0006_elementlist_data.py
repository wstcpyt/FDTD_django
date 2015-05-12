# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django_pgjson.fields


class Migration(migrations.Migration):

    dependencies = [
        ('refractiveindexdatabase', '0005_auto_20150419_1638'),
    ]

    operations = [
        migrations.AddField(
            model_name='elementlist',
            name='data',
            field=django_pgjson.fields.JsonField(default='{}'),
        ),
    ]
