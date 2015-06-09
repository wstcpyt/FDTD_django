# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django_pgjson.fields


class Migration(migrations.Migration):

    dependencies = [
        ('refractiveindexdatabase', '0006_elementlist_data'),
    ]

    operations = [
        migrations.AlterField(
            model_name='elementlist',
            name='data',
            field=django_pgjson.fields.JsonField(default={}),
        ),
    ]
