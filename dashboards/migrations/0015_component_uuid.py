# Generated by Django 3.1.7 on 2022-03-09 18:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboards', '0014_auto_20220301_1629'),
    ]

    operations = [
        migrations.AddField(
            model_name='component',
            name='uuid',
            field=models.CharField(max_length=48, null=True),
        ),
    ]