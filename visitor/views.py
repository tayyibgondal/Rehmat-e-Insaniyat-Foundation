from django.shortcuts import render, redirect
from employees.forms import (AskFAQForm, ContactUsForm, SubscriptionForm,
                             DonationForm, BloodDonationForm, VolunteerCreationForm)
from django.contrib import messages
from employees.models import Donor, BloodDonation

def home(request):
    return render(request, 'visitor/home.html')

def about(request):
    return render(request, 'visitor/about.html')

def subscribe(request):
    form = SubscriptionForm()
    if request.method == 'POST':
        form = SubscriptionForm(request.POST)
        if(form.is_valid()):
            messages.success(request, 'Subscribed Successfully!') 
            form.save()           
            return redirect('visitor-home')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def ask_question(request):
    form = AskFAQForm()
    if request.method == 'POST':
        form = AskFAQForm(request.POST)
        if(form.is_valid()):
            form.save()
            return redirect('faqs')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def contact_us(request):
    form = ContactUsForm()
    if request.method == 'POST':
        form = ContactUsForm(request.POST)
        if(form.is_valid()):
            messages.success(request, 'We will come to you shortly!') 
            form.save()           
            return redirect('visitor-home')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def donate(request):
    form = DonationForm()
    if request.method == 'POST':
        form = DonationForm(request.POST)
        if(form.is_valid()):
            donation = form.save(commit=False)
            # donor-related information
            first_name = form.cleaned_data['first_name']
            last_name = form.cleaned_data['last_name']
            email = form.cleaned_data['email']
            phone_no = form.cleaned_data['phone_no']
            # if the donor is not saved in our database, save it, else not
            donor = Donor.objects.filter(phone_no=phone_no)
            if not donor:
                donor = Donor.objects.create(first_name=first_name,
                                     last_name=last_name, 
                                     email=email, 
                                     phone_no=phone_no)
            messages.success(request, 'Donation Successful!')  
            donation.donor = donor  
            donation.save()        
            return redirect('visitor-home')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def donate_blood(request):
    form = BloodDonationForm()
    if request.method == 'POST':
        form = BloodDonationForm(request.POST)
        if(form.is_valid()):
            # donor-related information
            first_name = form.cleaned_data['first_name']
            last_name = form.cleaned_data['last_name']
            email = form.cleaned_data['email']
            phone_no = form.cleaned_data['phone_no']
            # donation-related information
            bloodtype = form.cleaned_data['bloodtype']
            # if the donation giver is not saved in our database, save it, else not
            donor = Donor.objects.filter(phone_no=phone_no).first()
            if not donor:
                donor = Donor.objects.create(first_name=first_name,
                                     last_name=last_name, 
                                     email=email, 
                                     phone_no=phone_no)
            messages.success(request, 'Donation Successful!')  
            # finally create blood donation record
            BloodDonation.objects.create(donor=donor, bloodtype=bloodtype)
            return redirect('visitor-home')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def become_volunteer(request):
    form = VolunteerCreationForm()
    if request.method == 'POST':
        form = VolunteerCreationForm(request.POST)
        if(form.is_valid()):
            messages.success(request, 'You have successfully become a volunteer! We\'ll get back to you shortly.')  
            form.save()
            return redirect('visitor-home')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)