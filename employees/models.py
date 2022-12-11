from django.utils.translation import gettext_lazy as _
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.db import models
from django.utils import timezone
from .managers import CustomUserManager
from django.db.models.signals import post_save, post_delete

class Employee(AbstractBaseUser, PermissionsMixin):
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    username = models.CharField(max_length=250, unique=True)
    email = models.EmailField(_('email address'), unique=True)
    role = models.CharField(max_length=100)

    description = models.TextField(null=True, blank=True)
    available = models.BooleanField(default=True)

    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(default=timezone.now)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['role', 'username']

    objects = CustomUserManager()

    def __str__(self):
        return self.username

class Volunteer(models.Model):
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.EmailField(null=True, blank=True)
    phone_no = models.IntegerField()
    available = models.BooleanField(default=True)
    date_joined = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return 'Volunteer ' + self.first_name + ' ' + self.last_name

class Topic(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Post(models.Model):
    author = models.ForeignKey(Employee, on_delete=models.CASCADE)
    title = models.ForeignKey(Topic, on_delete=models.SET_NULL, null=True)
    description = models.TextField(null=True, blank=True)
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-updated', '-created']

    def __str__(self):
        return self.title.name

class Department(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.name

class Benificiary(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    department = models.ForeignKey(Department, on_delete=models.SET_NULL, null=True)
    age = models.IntegerField()
    gender = models.CharField(max_length=10)

    def __str__(self):
        return self.first_name + ' ' + self.last_name

class Donor(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.EmailField()
    phone_no = models.CharField(max_length=30)

    def __str__(self):
        return self.first_name + ' ' + self.last_name

class Drive(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(null=True)
    start_date = models.DateTimeField(auto_now_add=True)
    required_funds = models.IntegerField()
    collected_funds = models.IntegerField()

    def __str__(self):
        return self.name

class PastDrive(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(null=True)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

class Donation(models.Model):
    donor = models.ForeignKey(Donor, on_delete=models.SET_NULL, null=True)
    amount = models.FloatField()
    department = models.ForeignKey(Department, on_delete=models.SET_NULL, null=True)
    drive = models.ForeignKey(Drive, on_delete=models.SET_NULL, null=True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.amount) + ' from ' + self.donor.first_name

class BloodDonation(models.Model):
    donor = models.ForeignKey(Donor, on_delete=models.SET_NULL, null=True)
    bloodtype = models.CharField(max_length=10)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return 'Blood from ' + self.donor.first_name

class Subscriber(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.EmailField()
    phone_no = models.CharField(max_length=30)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.first_name + ' ' + self.last_name

class Ambulance(models.Model):
    plate_no = models.CharField(max_length=100)
    driver = models.ForeignKey(Employee, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.plate_no
    
    def __init__(self, *args, **kwargs):
        super(Ambulance, self).__init__(*args, **kwargs)
        self.old_driver = self.driver

    def save(self, *args, **kwargs):
        # set availability of old driver to true
        if self.old_driver:
            self.old_driver.available = True
            self.old_driver.save()
        # setting availability of selected driver to false
        self.driver.available = False
        self.driver.save()       
        super().save(*args, **kwargs)
        self.old_driver = self.driver
    
    def delete(self, *args, **kwargs):
        # setting availibility of driver to True
        driver = self.driver
        driver.available = True
        driver.save() 
        super().delete(*args, **kwargs)

class Inventory(models.Model):
    item_name = models.CharField(max_length=100)
    item_count = models.IntegerField()
    donation = models.ForeignKey(Donation, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.item_name

class Dispensary(models.Model):
    medicine = models.CharField(max_length=100)
    count = models.IntegerField()
    category = models.CharField(max_length=100)
    expiry = models.DateTimeField()

    def __str__(self):
        return self.medicine

class BloodBank(models.Model):
    bloodType = models.CharField(max_length=10)
    count = models.IntegerField()

    def __str__(self):
        return self.bloodType

class FAQ(models.Model):
    question = models.TextField()
    answer = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.question

class Pitch(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField(null=True, blank=True)
    phone_no = models.IntegerField()

    def __str__(self):
        return 'Pitch by ' + self.name

