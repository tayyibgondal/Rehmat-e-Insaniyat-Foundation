from django.shortcuts import render, redirect
from employees.forms import (AskFAQForm, ContactUsForm, SubscriptionForm,
                             DonationForm, BloodDonationForm, VolunteerCreationForm)
from django.contrib import messages
from employees.models import (Donor, BloodDonation, Post, Topic,
                              Department, Drive, PastDrive, Employee,
                              FAQ)
from django.db.models import Q


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

def team(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    team = Employee.objects.filter(
        Q(role__icontains=q)
        )
    team_count = team.count()

    context = {
        'team': team,
        'team_count': team_count,
    }
    return render(request, 'visitor/team.html', context)

def faqs(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    faqs = FAQ.objects.filter(
        Q(question__icontains=q)
        )

    context = {
        'faqs': faqs,
    }
    return render(request, 'visitor/faqs.html', context)

def past_drives(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    past_drives = PastDrive.objects.filter(
        Q(name__icontains=q)
        )

    past_drive_count = past_drives.count()

    context = {
        'past_drives': past_drives,
        'past_drive_count': past_drive_count,
    }
    return render(request, 'visitor/past_drives.html', context)

def drives(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    drives = Drive.objects.filter(
        Q(name__icontains=q)
        )

    drive_count = drives.count()

    context = {
        'drives': drives,
        'drive_count': drive_count,
    }
    return render(request, 'visitor/drives.html', context)

def departments(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''
    departments = Department.objects.filter(name__icontains=q)
    context = {
        'departments': departments,
    }
    return render(request, 'visitor/departments.html', context)

def all_posts(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    posts = Post.objects.filter(
        Q(title__name__icontains=q) |
        Q(description__icontains=q)
        )
    post_count = posts.count()
    topics = Topic.objects.all()
    
    context = {
        'posts': posts,
        'topics': topics,
        'post_count': post_count,
    }
    return render(request, 'visitor/posts.html', context)

def post(request, pk):
    post = Post.objects.get(id=pk)
    context = {
        'post': post,
    }
    return render(request, 'visitor/post.html', context)

def profile(request, pk):
    employee = Employee.objects.get(id=pk)
    context = {
        'employee': employee,
    }
    return render(request, 'visitor/profile.html', context)