# Generated by Django 3.1.7 on 2022-01-25 20:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboards', '0009_layout_data'),
    ]

    operations = [
        migrations.AddField(
            model_name='layout',
            name='temp',
            field=models.JSONField(blank=True, null=True),
        ),
    ]
