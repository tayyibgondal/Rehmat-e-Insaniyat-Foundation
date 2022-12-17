from django.forms import widgets
from django.shortcuts import render, redirect, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.db.models import Q
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from .models import (Post, Topic, Department, Benificiary, Donation,
                     BloodDonation, Donor, Subscriber, Drive, PastDrive,
                     Ambulance, Inventory, Dispensary, BloodBank, FAQ, Pitch,
                     Employee, Volunteer)
from .forms import (PostForm, DepartmentForm, BenificiaryForm, DriveForm, PastDriveForm,
                     AmbulanceAdditionForm, AmbulanceUpdationForm, InventoryForm, DispensaryForm,
                     BloodBankAdditionForm, FAQUpdationForm, CustomUserChangeForm, CustomUserCreationForm,
                     )
from django.utils import timezone

def home(request):
    return render(request, 'employees/home.html')

def LoginView(request):
    # if user was already logged in
    if request.user.is_authenticated:
        return redirect('emp-home')

    msg = 'None'
    # getting data from user
    if request.method == 'POST':
        email = request.POST.get('email').lower()
        password = request.POST.get('password')

        # checking if user exists or not
        try:
            Employee.objects.get(email=email)
            # Authenticating the user and proceeding accordingly
            # (authenticate function returns NONE if user is not authenticated)
            user = authenticate(request, email=email, password=password)
            if user is not None:
                login(request, user)
                return redirect('emp-home')
            else:
                msg = 'Incorrect Email or Password!'
        except:
            msg = 'User does not exist!'
    context = {
        "msg":msg,
        "msgcount":len(msg)
    }
    return render(request, 'employees/login.html', context)

@csrf_exempt
def register(request):
    form = CustomUserCreationForm()
    

    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)

            user.username = user.username.lower()
            user.save()

            return redirect('login')

    context = {
        'form': form,
    }
    return render(request, 'employees/register.html', context)

def LogoutView(request):
    if request.method == 'POST':
        logout(request)
        return redirect('visitor-home')
    return render(request, 'employees/logout.html')

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
    return render(request, 'employees/posts.html', context)

def post(request, pk):
    post = Post.objects.get(id=pk)
    context = {
        'post': post,
    }
    return render(request, 'employees/post.html', context)

@login_required(login_url='login')
def create_post(request):
    form = PostForm()
    if request.method == 'POST':
        form = PostForm(request.POST)
        if(form.is_valid()):
            post = form.save(commit=False)
            post.author = request.user
            post.save()
            return redirect('all-posts')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

@login_required(login_url='login')
def update_post(request, pk):
    post = Post.objects.get(id=pk)

    if request.user != post.author:
        return HttpResponse('You are not allowed here!')

    form = PostForm(instance=post)

    if request.method == 'POST':
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            form.save()
            return redirect('all-posts')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

@login_required(login_url='login')
def delete_post(request, pk):
    post = Post.objects.get(id=pk)

    if request.user != post.author:
        return HttpResponse('You are not allowed here!')

    if request.method == "POST":
        post.delete()
        return redirect('all-posts')

    return render(request, 'employees/delete.html', {'obj': post})

def departments(request):
    departments = Department.objects.all()
    context = {
        'departments': departments,
    }
    return render(request, 'employees/departments.html', context)

def create_department(request):
    form = DepartmentForm()
    if request.method == 'POST':
        form = DepartmentForm(request.POST)
        if(form.is_valid()):
            form.save()
            return redirect('departments')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def update_department(request, pk):
    department = Department.objects.get(id=pk)

    form = DepartmentForm(instance=department)

    if request.method == 'POST':
        form = DepartmentForm(request.POST, instance=department)
        if form.is_valid():
            form.save()
            return redirect('departments')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def remove_department(request, pk):
    department = Department.objects.get(id=pk)

    if request.method == "POST":
        department.delete()
        return redirect('departments')

    return render(request, 'employees/delete.html', {'obj': department})

def view_department_beneficiaries(request, pk):
    benificiaries = Benificiary.objects.filter(department__name=pk)
    benificiary_count = benificiaries.count()
    
    context = {
        'benificiaries': benificiaries,
        'benificiary_count': benificiary_count,
        'department': pk,
    }
    return render(request, 'employees/dept_beneficiaries.html', context) 

def benificiaries(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    benificiaries = Benificiary.objects.filter(
        Q(first_name__icontains=q) |
        Q(last_name__icontains=q) |
        Q(department__name=q)
        )

    benificiary_count = benificiaries.count()
    
    context = {
        'benificiaries': benificiaries,
        'benificiary_count': benificiary_count,
    }
    return render(request, 'employees/benificiaries.html', context)

def create_benificiary(request):
    form = BenificiaryForm()
    if request.method == 'POST':
        form = BenificiaryForm(request.POST)
        if(form.is_valid()):
            form.save()
            return redirect('benificiaries')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def update_benificiary(request, pk):
    benificiary = Benificiary.objects.get(id=pk)

    form = BenificiaryForm(instance=benificiary)

    if request.method == 'POST':
        form = BenificiaryForm(request.POST, instance=benificiary)
        if form.is_valid():
            form.save()
            return redirect('benificiaries')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def remove_benificiary(request, pk):
    benificiary = Benificiary.objects.get(id=pk)

    if request.method == "POST":
        benificiary.delete()
        return redirect('benificiaries')

    return render(request, 'employees/delete.html', {'obj': benificiary})

def blood_donations(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    blood_donations = BloodDonation.objects.filter(
        Q(donor__first_name__icontains=q) |
        Q(donor__last_name__icontains=q)
        )

    blood_donation_count = blood_donations.count() 
    
    context = {
        'blood_donations': blood_donations,
        'blood_donation_count': blood_donation_count,
    }
    return render(request, 'employees/blood_donations.html', context)

def donors(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    donors = Donor.objects.filter(
        Q(first_name__icontains=q) |
        Q(last_name__icontains=q)
        )

    donor_count = donors.count()
    
    context = {
        'donors': donors,
        'donor_count': donor_count,
    }
    return render(request, 'employees/donors.html', context)

def donations(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    donations = Donation.objects.filter(
        Q(donor__first_name__icontains=q) |
        Q(donor__last_name__icontains=q)
        )

    context = {
        'donations': donations,
    }
    return render(request, 'employees/donations.html', context)

def subscribers(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    subscribers = Subscriber.objects.filter(
        Q(first_name__icontains=q) |
        Q(last_name__icontains=q)
        )

    subscriber_count = subscribers.count()

    context = {
        'subscribers': subscribers,
        'subscriber_count': subscriber_count,
    }
    return render(request, 'employees/subscribers.html', context)

def delete_subscriber(request, pk):
    subscriber = Subscriber.objects.get(id=pk)

    if request.method == "POST":
        subscriber.delete()
        return redirect('subscribers')

    return render(request, 'employees/delete.html', {'obj': subscriber})

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
    return render(request, 'employees/drives.html', context)

def create_drive(request):
    form = DriveForm()
    if request.method == 'POST':
        form = DriveForm(request.POST)
        if(form.is_valid()):
            form.save()
            return redirect('drives')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def update_drive(request, pk):
    drive = Drive.objects.get(id=pk)

    form = DriveForm(instance=drive)

    if request.method == 'POST':
        form = DriveForm(request.POST, instance=drive)
        if form.is_valid():
            form.save()
            return redirect('drives')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def terminate_drive(request, pk):
    drive = Drive.objects.get(id=pk)

    if request.method == "POST":
        name = drive.name
        description = drive.description
        start_date = drive.start_date
        end_date = timezone.now()
        PastDrive.objects.create(name=name, description=description, 
                                 start_date=start_date, end_date=end_date)
        drive.delete()
        return redirect('drives')

    return render(request, 'employees/terminate_drive.html', {'obj': drive})


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
    return render(request, 'employees/past_drives.html', context)

def update_past_drive(request, pk):
    drive = PastDrive.objects.get(id=pk)

    form = PastDriveForm(instance=drive)

    if request.method == 'POST':
        form = PastDriveForm(request.POST, instance=drive)
        if form.is_valid():
            form.save()
            return redirect('past-drives')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def ambulances(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    ambulances = Ambulance.objects.filter(
        Q(plate_no__icontains=q)
        )

    ambulances_count = ambulances.count()

    context = {
        'ambulances': ambulances,
        'ambulances_count': ambulances_count,
    }
    return render(request, 'employees/ambulances.html', context)

def add_ambulance(request):
    form = AmbulanceAdditionForm()
    if request.method == 'POST':
        form = AmbulanceAdditionForm(request.POST)
        if(form.is_valid()):
            form.save()
            return redirect('ambulances')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def update_ambulance(request, pk):
    ambulance = Ambulance.objects.get(id=pk)
    old_driver = ambulance.driver
    form = AmbulanceUpdationForm(instance=ambulance)

    if request.method == 'POST':
        form = AmbulanceUpdationForm(request.POST, instance=ambulance)
        if form.is_valid():
            form.save()
            return redirect('ambulances')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def remove_ambulance(request, pk):
    ambulance = Ambulance.objects.get(id=pk)

    if request.method == "POST":
        ambulance.delete()
        return redirect('ambulances')

    return render(request, 'employees/delete.html', {'obj': ambulance})

def inventory(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    items = Inventory.objects.filter(
        Q(item_name__icontains=q)
        )

    context = {
        'items': items,
    }
    return render(request, 'employees/inventory.html', context)

def add_item(request):
    form = InventoryForm()
    if request.method == 'POST':
        form = InventoryForm(request.POST)
        if(form.is_valid()):
            form.save()
            return redirect('inventory')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def update_item(request, pk):
    item = Inventory.objects.get(id=pk)

    form = InventoryForm(instance=item)

    if request.method == 'POST':
        form = InventoryForm(request.POST, instance=item)
        if form.is_valid():
            form.save()
            return redirect('inventory')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def deliver_item(request, pk):
    item = Inventory.objects.get(id=pk)

    if request.method == "POST":
        item.delete()
        return redirect('inventory')

    return render(request, 'employees/deliver.html', {'obj': item})

def dispensary(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    items = Dispensary.objects.filter(
        Q(medicine__icontains=q) |
        Q(category__icontains=q)
        )

    context = {
        'items': items,
    }
    return render(request, 'employees/dispensary.html', context)

def add_med_item(request):
    form = DispensaryForm()
    if request.method == 'POST':
        form = DispensaryForm(request.POST)
        if(form.is_valid()):
            form.save()
            return redirect('dispensary')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def update_med_item(request, pk):
    item = Dispensary.objects.get(id=pk)

    form = DispensaryForm(instance=item)

    if request.method == 'POST':
        form = DispensaryForm(request.POST, instance=item)
        if form.is_valid():
            form.save()
            return redirect('dispensary')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def deliver_med_item(request, pk):
    item = Dispensary.objects.get(id=pk)

    if request.method == "POST":
        item.delete()
        return redirect('dispensary')

    return render(request, 'employees/deliver.html', {'obj': item})
    
def blood_bank(request):
    msg = 'None'
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    items = BloodBank.objects.filter(
        Q(bloodType__icontains=q)
        )

    context = {
        'items': items,
        'msg':msg,
    }
    return render(request, 'employees/blood_bank.html', context)

def add_blood_item(request):
    form = BloodBankAdditionForm()
    if request.method == 'POST':
        form = BloodBankAdditionForm(request.POST)
        if(form.is_valid()):
            form.save()
            return redirect('blood-bank')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def deliver_blood_item(request, pk):
    blood_item = BloodBank.objects.get(id=pk)

    if request.method == 'POST':
        req_count = int(request.POST.get('count'))

        if blood_item.count < req_count:
            messages.error(request, "Not enough Blood Samples!")
        elif blood_item.count - req_count == 0:
            blood_item.delete()
        else:
            new_count = blood_item.count - req_count
            blood_item.count = new_count
            blood_item.save()

        return redirect('blood-bank')

    blood_group = blood_item.bloodType
    context = {
        'blood_group': blood_group,
        'blood_id': blood_item.id,
    }
    
    return render(request, 'employees/deliver_blood.html', context)

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
    return render(request, 'employees/faqs.html', context)


def answer_question(request, pk):
    question = FAQ.objects.get(id=pk)

    form = FAQUpdationForm(instance=question)

    if request.method == 'POST':
        form = FAQUpdationForm(request.POST, instance=question)
        if form.is_valid():
            form.save()
            return redirect('faqs')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def remove_faq(request, pk):
    faq = FAQ.objects.get(id=pk)

    if request.method == "POST":
        faq.delete()
        return redirect('faqs')

    return render(request, 'employees/delete.html', {'obj': faq})

def pitches(request):
    if request.GET.get('q') != None:
        q = request.GET.get('q')  
    else:
        q = ''

    pitches = Pitch.objects.filter(
        Q(name__icontains=q)
        )

    context = {
        'pitches': pitches,
    }
    return render(request, 'employees/pitches.html', context)

def remove_pitch(request, pk):
    pitch = Pitch.objects.get(id=pk)

    if request.method == "POST":
        pitch.delete()
        return redirect('pitches')

    return render(request, 'employees/delete.html', {'obj': pitch})

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
    return render(request, 'employees/team.html', context)
        
def profile(request, pk):
    employee = Employee.objects.get(id=pk)
    context = {
        'employee': employee,
    }
    return render(request, 'employees/profile.html', context)

def edit_personal_profile(request, pk):
    profile = Employee.objects.get(id=pk)

    form = CustomUserChangeForm(instance=profile)

    if request.method == 'POST':
        form = CustomUserChangeForm(request.POST, instance=profile)
        if form.is_valid():
            form.save()
            return redirect('emp-home')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

def volunteers(request):
    volunteers = Volunteer.objects.all()

    volunteer_count = volunteers.count()
    
    context = {
        'volunteers': volunteers,
        'volunteer_count': volunteer_count,
    }
    return render(request, 'employees/volunteers.html', context)

def remove_volunteer(request, pk):
    volunteer = Volunteer.objects.get(id=pk)

    if request.method == "POST":
        volunteer.delete()
        return redirect('volunteers')

    return render(request, 'employees/delete.html', {'obj': volunteer})

def available_vols(request):
    volunteers = Volunteer.objects.filter(available=True) 

    volunteer_count = volunteers.count()
    
    context = {
        'volunteers': volunteers,
        'volunteer_count': volunteer_count,
    }
    return render(request, 'employees/volunteers.html', context)

def make_vol_available(request, pk):
    volunteer = Volunteer.objects.get(id=pk) 
    if volunteer.available == True:
        messages.info(request, 'Volunteer is already Available!')
        return redirect('volunteers')
    else:
        volunteer.available = True
        volunteer.save()
        messages.info(request, 'Volunteer Made Available!')
        return redirect('volunteers')

def make_vol_unavailable(request, pk):
    volunteer = Volunteer.objects.get(id=pk) 
    if volunteer.available == False:
        messages.info(request, 'Volunteer is already Unavailable!')
        return redirect('volunteers')
    else:
        volunteer.available = False
        volunteer.save()
        messages.info(request, 'Volunteer Freed!')
        return redirect('volunteers')
        