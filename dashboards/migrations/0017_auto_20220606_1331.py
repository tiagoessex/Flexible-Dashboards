# Generated by Django 3.1.7 on 2022-06-06 12:31

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('dashboards', '0016_dashboard_date_format'),
    ]

    operations = [
        migrations.CreateModel(
            name='Snapshot',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=80)),
                ('description', models.CharField(blank=True, max_length=128, null=True)),
                ('title', models.CharField(blank=True, max_length=128, null=True)),
                ('date_format', models.CharField(blank=True, max_length=16, null=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('date_updated', models.DateTimeField(auto_now=True)),
                ('dashboard_data', models.JSONField(blank=True, null=True)),
                ('components_data', models.JSONField(blank=True, null=True)),
                ('author', models.ForeignKey(blank=True, db_column='author', default=None, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='snapshot_author', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name_plural': 'Snapshots',
                'db_table': 'dash_snapshot',
            },
        ),
        migrations.AddConstraint(
            model_name='snapshot',
            constraint=models.UniqueConstraint(fields=('name',), name='snapshot_name'),
        ),
    ]
