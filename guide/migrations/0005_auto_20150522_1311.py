# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0004_auto_20150522_0157'),
    ]

    operations = [
        migrations.AlterField(
            model_name='releasenote',
            name='type',
            field=models.CharField(choices=[(('N',), 'NEW'), ('U', 'UPDATE')], max_length=200),
        ),
    ]