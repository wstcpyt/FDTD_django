# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0016_auto_20150524_1358'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='releasenote',
            options={'ordering': ['type']},
        ),
    ]