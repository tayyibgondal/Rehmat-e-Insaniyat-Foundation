from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.forms import ModelForm, widgets
from .models import (Post, Department, Benificiary, Drive, 
                     PastDrive, Ambulance, Inventory, BloodBank,
                     Dispensary, FAQ, Pitch, Subscriber, Donation,
                     Employee, Volunteer)
from django.db.models import Q

class CustomUserCreationForm(UserCreationForm):

    class Meta:
        model = Employee
        fields = ('first_name', 'last_name', 'username', 'email','role', 'is_staff')


class CustomUserChangeForm(UserChangeForm):
    password = None
    class Meta:
        model = Employee
        fields = ('first_name', 'last_name', 'username', 'email','role', 'description')

class PostForm(ModelForm):

    class Meta:
        model = Post
        fields = '__all__'
        exclude = ['author']

class DepartmentForm(ModelForm):

    class Meta:
        model = Department
        fields = '__all__'

class BenificiaryForm(ModelForm):

    class Meta:
        model = Benificiary
        fields = '__all__'

class DriveForm(ModelForm):

    class Meta:
        model = Drive
        fields = '__all__'

class PastDriveForm(ModelForm):

    class Meta:
        model = PastDrive
        fields = ['name', 'description']

class AmbulanceUpdationForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(AmbulanceUpdationForm, self).__init__(*args, **kwargs)
        self.fields['driver'].queryset = Employee.objects.filter(
                                                           Q(role='Driver') &
                                                           Q(available=True)
                                                          )

    class Meta:
        model = Ambulance
        fields = ['driver']

class AmbulanceAdditionForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(AmbulanceAdditionForm, self).__init__(*args, **kwargs)
        self.fields['driver'].queryset = Employee.objects.filter(
                                                           Q(role='Driver') &
                                                           Q(available=True)
                                                          )

    class Meta:
        model = Ambulance
        fields = '__all__'
        

class DispensaryForm(ModelForm):

    class Meta:
        model = Dispensary
        fields = '__all__'

class InventoryForm(ModelForm):

    class Meta:
        model = Inventory
        fields = '__all__'

class BloodBankAdditionForm(ModelForm):

    class Meta:
        model = BloodBank
        fields = '__all__'

class BloodBankUpdationForm(ModelForm):

    class Meta:
        model = BloodBank
        fields = ['count']

class FAQUpdationForm(ModelForm):

    class Meta:
        model = FAQ
        fields = '__all__'

class AskFAQForm(ModelForm):

    class Meta:
        model = FAQ
        fields = ['question']

class ContactUsForm(ModelForm):

    class Meta:
        model = Pitch
        fields = '__all__'
        
class SubscriptionForm(ModelForm):

    class Meta:
        model = Subscriber
        fields = '__all__'

class DonationForm(ModelForm):
    first_name = forms.CharField(max_length=30)
    last_name = forms.CharField(max_length=30)
    email = forms.EmailField()
    phone_no = forms.CharField(max_length=30)

    class Meta:
        model = Donation
        fields = ['first_name', 'last_name', 'email', 'phone_no', 'amount', 'department', 'drive']
        exclude = ['donor']
        widgets = {'first_name':forms.TextInput(attrs={'class':'usr_rect'})}

class BloodDonationForm(forms.Form):
    first_name = forms.CharField(max_length=30)
    last_name = forms.CharField(max_length=30)
    email = forms.EmailField()
    phone_no = forms.CharField(max_length=30)
    bloodtype = forms.CharField(max_length=5)

class VolunteerCreationForm(ModelForm):

    class Meta:
        model = Volunteer
        fields = '__all__'

