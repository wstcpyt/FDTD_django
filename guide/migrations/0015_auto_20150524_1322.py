# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0014_auto_20150524_0024'),
    ]

    operations = [
        migrations.AlterField(
            model_name='releasenote',
            name='type',
            field=models.CharField(choices=[('NEW', 'NEW'), ('CHANGED', 'CHANGED'), ('DEV', 'DEV')], default='NEW', max_length=10),
        ),
    ]
