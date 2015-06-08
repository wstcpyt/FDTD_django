# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fdtdonthecloud', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='fdtdproject',
            old_name='category',
            new_name='user',
        ),
    ]
