# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0009_auto_20150522_1352'),
    ]

    operations = [
        migrations.AlterField(
            model_name='releasenote',
            name='note',
            field=models.CharField(max_length=200, default=''),
        ),
    ]
