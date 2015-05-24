# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('guide', '0011_auto_20150522_1354'),
    ]

    operations = [
        migrations.AlterField(
            model_name='releasenote',
            name='releaseVersion',
            field=models.ForeignKey(to='guide.ReleaseVersion', related_name='releasenotes', default=None),
        ),
    ]
