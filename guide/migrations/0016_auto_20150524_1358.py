# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0015_auto_20150524_1322'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='releaseversion',
            options={'ordering': ['time']},
        ),
    ]
