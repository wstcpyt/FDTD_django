# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ReleaseNote',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('type', models.TextField(default='')),
            ],
        ),
        migrations.CreateModel(
            name='ReleaseVersion',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('version', models.TextField(unique=True)),
                ('time', models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.AddField(
            model_name='releasenote',
            name='releaseVersion',
            field=models.ForeignKey(default=None, to='guide.ReleaseVersion'),
        ),
    ]
