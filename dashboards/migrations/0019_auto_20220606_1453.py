# Generated by Django 3.1.7 on 2022-06-06 13:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboards', '0018_auto_20220606_1334'),
    ]

    operations = [
        migrations.RenameField(
            model_name='snapshot',
            old_name='components_data',
            new_name='components_content',
        ),
        migrations.RenameField(
            model_name='snapshot',
            old_name='dashboard_data',
            new_name='data',
        ),
        migrations.AddField(
            model_name='snapshot',
            name='global_date',
            field=models.CharField(blank=True, max_length=80, null=True),
        ),
    ]
