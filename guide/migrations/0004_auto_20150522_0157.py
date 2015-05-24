# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0003_auto_20150522_0123'),
    ]

    operations = [
        migrations.AddField(
            model_name='releasenote',
            name='note',
            field=models.TextField(default=''),
        ),
        migrations.AlterField(
            model_name='releasenote',
            name='type',
            field=models.CharField(max_length=200, default=''),
        ),
    ]
