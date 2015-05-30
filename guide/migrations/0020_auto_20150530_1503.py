# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0019_auto_20150524_1411'),
    ]

    operations = [
        migrations.AlterField(
            model_name='releasenote',
            name='type',
            field=models.CharField(choices=[('NEW', 'NEW'), ('CHANGED', 'CHANGED'), ('DEV', 'DEV'), ('ISSUES', 'ISSUES'), ('FIXED', 'FIXED')], max_length=10, default='NEW'),
        ),
    ]
