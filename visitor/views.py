from django.shortcuts import render, redirect
from employees.forms import (AskFAQForm, ContactUsForm, SubscriptionForm,
                             DonationForm, BloodDonationForm, VolunteerCreationForm,
                             DonationFormFromDept, DonationFormFromDrive)
from django.contrib import messages
from employees.models import (Donor, BloodDonation, Post, Topic,
                              Department, Drive, PastDrive, Employee,
                              FAQ)
from django.db.models import Q


def home(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    context = {
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'visitor/home.html', context)

def about(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    context = {
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'visitor/about.html', context)

def subscribe(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    form = SubscriptionForm()
    if request.method == 'POST':
        form = SubscriptionForm(request.POST)
        if(form.is_valid()):
            messages.success(request, 'Subscribed Successfully!') 
            form.save()           
            return redirect('visitor-home')
        else:
            messages.error(request, 'Enter correct data in fields!') 
            context = {
                'form': form,
                'faqs': faqs, 
                'drives': drives,
            }
            return render(request, 'employees/model_form.html', context)
    context = {
        'form': form,
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'employees/model_form.html', context)

def ask_question(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    form = AskFAQForm()
    if request.method == 'POST':
        form = AskFAQForm(request.POST)
        if(form.is_valid()):
            messages.success(request, 'Question submitted Successfully!') 
            form.save()
            return redirect('vis-faqs')
    context = {
        'form': form,
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'employees/model_form.html', context)

def contact_us(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    form = ContactUsForm()
    if request.method == 'POST':
        form = ContactUsForm(request.POST)
        if(form.is_valid()):
            messages.success(request, 'We will come to you shortly!') 
            form.save()           
            return redirect('visitor-home')
    context = {
        'form': form,
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'employees/model_form.html', context)

def donate(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]

    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    drive = Drive.objects.filter(name=q)
    department = Department.objects.filter(name=q)
    if drive:  # if we are coming from some drive
        form = DonationFormFromDrive(initial={'drive': drive[0],})
    elif department:  # if we are coming from some department
        form = DonationFormFromDept(initial={'department': department[0],})
    else:
        form = DonationForm()    
    
    if request.method == 'POST':
        form = DonationForm(request.POST)
        if(form.is_valid()):
            messages.success(request, 'Donation Successful!')  
            donation = form.save(commit=False)
            # donor-related information
            first_name = form.cleaned_data['first_name']
            last_name = form.cleaned_data['last_name']
            email = form.cleaned_data['email']
            phone_no = form.cleaned_data['phone_no']
            # if the donor is not saved in our database, save it, else not
            donor = Donor.objects.filter(phone_no=phone_no)
            donor = donor[0]
            if not donor:
                donor = Donor.objects.create(first_name=first_name,
                                     last_name=last_name, 
                                     email=email, 
                                     phone_no=phone_no)

            donation.donor = donor
            donation.save()        
            return redirect('visitor-home')
    context = {
        'form': form,
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'employees/model_form.html', context)

def donate_blood(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    form = BloodDonationForm()
    if request.method == 'POST':
        form = BloodDonationForm(request.POST)
        if(form.is_valid()):
            messages.success(request, 'Donation Successful!')  
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
            # finally create blood donation record
            BloodDonation.objects.create(donor=donor, bloodtype=bloodtype)
            return redirect('visitor-home')
    context = {
        'form': form,
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'employees/model_form.html', context)

def become_volunteer(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    form = VolunteerCreationForm()
    if request.method == 'POST':
        form = VolunteerCreationForm(request.POST)
        if(form.is_valid()):
            messages.success(request, 'You have successfully become a volunteer! We\'ll get back to you shortly.')  
            form.save()
            return redirect('visitor-home')
    context = {
        'form': form,
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'employees/model_form.html', context)

def team(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
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
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'visitor/team.html', context)

def faqs(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    faqss = FAQ.objects.filter(
        Q(question__icontains=q)
        )

    context = {
        'faqs': faqs,
        'faqss': faqss, 
        'drives': drives,
    }
    return render(request, 'visitor/faqs.html', context)

def past_drives(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
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
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'visitor/past_drives.html', context)

def drives(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    drivess = Drive.objects.filter(
        Q(name__icontains=q)
        )

    drive_count = drives.count()

    context = {
        'drivess': drivess,
        'drive_count': drive_count,
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'visitor/drives.html', context)

def departments(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''
    departments = Department.objects.filter(name__icontains=q)
    context = {
        'departments': departments,
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'visitor/departments.html', context)

def all_posts(request):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    posts = Post.objects.filter(
        Q(title__name__icontains=q) |
        Q(description__icontains=q)
        )
    post_count = posts.count()
    topics = Topic.objects.order_by('-id')[:2]
    
    context = {
        'posts': posts,
        'topics': topics,
        'post_count': post_count,
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'visitor/posts.html', context)

def post(request, pk):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    post = Post.objects.get(id=pk)
    context = {
        'post': post,
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'visitor/post.html', context)

def profile(request, pk):
    faqs = FAQ.objects.all().order_by('-id')[:4]
    drives = Drive.objects.all().order_by('-id')[:4]
    employee = Employee.objects.get(id=pk)
    context = {
        'employee': employee,
        'faqs': faqs, 
        'drives': drives,
    }
    return render(request, 'visitor/profile.html', context)