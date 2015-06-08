# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('fdtdonthecloud', '0003_remove_fdtdproject_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='fdtdproject',
            name='user',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL, default=None),
        ),
    ]
