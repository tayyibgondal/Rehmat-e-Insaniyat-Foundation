# Generated by Django 4.1.4 on 2022-12-11 10:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employees', '0007_drive_collected_funds_drive_required_funds'),
    ]

    operations = [
        migrations.AlterField(
            model_name='department',
            name='description',
            field=models.TextField(blank=True, null=True),
        ),
    ]
