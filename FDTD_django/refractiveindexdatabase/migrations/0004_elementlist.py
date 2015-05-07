# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('refractiveindexdatabase', '0003_auto_20150414_0108'),
    ]

    operations = [
        migrations.CreateModel(
            name='Elementlist',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('title', models.TextField()),
                ('references', models.TextField(default='')),
                ('comments', models.TextField(default='')),
                ('type', models.TextField()),
                ('toprange', models.FloatField()),
                ('bottomrange', models.FloatField()),
                ('datalink', models.TextField()),
                ('element', models.ForeignKey(default=None, to='refractiveindexdatabase.Element')),
            ],
        ),
    ]
