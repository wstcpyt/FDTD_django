# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0018_auto_20150524_1401'),
    ]

    operations = [
        migrations.AlterField(
            model_name='releasenote',
            name='type',
            field=models.CharField(default='NEW', choices=[('NEW', 'NEW'), ('CHANGED', 'CHANGED'), ('DEV', 'DEV'), ('ISSUES', 'ISSUES')], max_length=10),
        ),
    ]
