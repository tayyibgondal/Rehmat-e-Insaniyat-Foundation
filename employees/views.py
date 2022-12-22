from django.shortcuts import render, redirect, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.db.models import Q, Sum
from django.contrib.auth.models import Group
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from .models import (Post, Topic, Department, Benificiary, Donation,
                     BloodDonation, Donor, Subscriber, Drive, PastDrive,
                     Ambulance, Inventory, Dispensary, BloodBank, FAQ, Pitch,
                     Employee, Volunteer, Topic)
from .forms import (PostForm, DepartmentForm, BenificiaryForm, DriveForm, PastDriveForm,
                     AmbulanceAdditionForm, AmbulanceUpdationForm, InventoryForm, DispensaryForm,
                     BloodBankAdditionForm, FAQUpdationForm, CustomUserChangeForm, CustomUserCreationForm,
                     TopicForm 
                     )
from django.utils import timezone

@login_required(login_url='login')
def home(request):
    donations_sum = Donation.objects.aggregate(Sum('amount')).get('amount__sum')
    items_sum = int(Inventory.objects.aggregate(Sum('item_count')).get('item_count__sum')) if Inventory.objects.aggregate(Sum('item_count')).get('item_count__sum') else None
    volunteers_sum = Volunteer.objects.all().count()

    recent_donations = Donation.objects.all().order_by('-id')[:3]
    items_to_runout = Inventory.objects.all().order_by('item_count')[:3]
    recent_volunteers = Volunteer.objects.all().order_by('-id')[:3] 

    context = {
        'donations_sum': donations_sum,
        'items_sum': items_sum,
        'volunteers_sum': volunteers_sum,
        'recent_donations': recent_donations,
        'items_to_runout': items_to_runout,
        'recent_volunteers': recent_volunteers,
    }
    return render(request, 'employees/home.html', context)

@csrf_exempt
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
@login_required(login_url='login')
def register(request):
    form = CustomUserCreationForm()
    

    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)

            user.role = user.role.lower()
            user.save()

            user_group = Group.objects.get(name=user.role) 
            print(user_group)
            user.groups.add(user_group)
            print('after adding group', user_group)

            return redirect('login')

    context = {
        'form': form,
    }
    return render(request, 'employees/register.html', context)

@login_required(login_url='login')
def fire_employee(request, pk):
    employee = Employee.objects.get(id=pk)

    emp_is_sup = employee.is_superuser
    firer_is_not_sup = request.user.is_superuser == True

    if ((emp_is_sup and firer_is_not_sup) or 
        request.user == employee):
        return render(request, 'forbidden_403.html')

    if request.method == "POST":
        employee.delete()
        return redirect('team')

    return render(request, 'employees/delete.html', {'obj': employee})

@login_required(login_url='login')
def LogoutView(request):
    if request.method == 'POST':
        logout(request)
        return redirect('visitor-home')
    return render(request, 'employees/logout.html')

# @allowed_users(allowed_roles=['admin', 'driver', 'manager'])
@login_required(login_url='login')
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
    
@login_required(login_url='login')
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

def add_topic(request):
    form = TopicForm()
    if request.method == 'POST':
        form = TopicForm(request.POST)
        if(form.is_valid()):
            form.save()
            return redirect('all-posts')
    context = {
        'form': form,
    }
    return render(request, 'employees/model_form.html', context)

@login_required(login_url='login')
def departments(request):
    departments = Department.objects.all()
    context = {
        'departments': departments,
    }
    return render(request, 'employees/departments.html', context)

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
def remove_department(request, pk):
    department = Department.objects.get(id=pk)

    if request.method == "POST":
        department.delete()
        return redirect('departments')

    return render(request, 'employees/delete.html', {'obj': department})

@login_required(login_url='login')
def view_department_beneficiaries(request, pk):
    benificiaries = Benificiary.objects.filter(department__name=pk)
    benificiary_count = benificiaries.count()
    
    context = {
        'benificiaries': benificiaries,
        'benificiary_count': benificiary_count,
        'department': pk,
    }
    return render(request, 'employees/dept_beneficiaries.html', context) 

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
def remove_benificiary(request, pk):
    benificiary = Benificiary.objects.get(id=pk)

    if request.method == "POST":
        benificiary.delete()
        return redirect('benificiaries')

    return render(request, 'employees/delete.html', {'obj': benificiary})

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
def delete_subscriber(request, pk):
    subscriber = Subscriber.objects.get(id=pk)

    if request.method == "POST":
        subscriber.delete()
        return redirect('subscribers')

    return render(request, 'employees/delete.html', {'obj': subscriber})

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
def remove_ambulance(request, pk):
    ambulance = Ambulance.objects.get(id=pk)

    if request.method == "POST":
        ambulance.delete()
        return redirect('ambulances')

    return render(request, 'employees/delete.html', {'obj': ambulance})

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
def deliver_item(request, pk):
    item = Inventory.objects.get(id=pk)

    if request.method == "POST":
        item.delete()
        return redirect('inventory')

    return render(request, 'employees/deliver.html', {'obj': item})

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
def deliver_med_item(request, pk):
    item = Dispensary.objects.get(id=pk)

    if request.method == "POST":
        item.delete()
        return redirect('dispensary')

    return render(request, 'employees/deliver.html', {'obj': item})
    
@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
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

@login_required(login_url='login')
def remove_faq(request, pk):
    faq = FAQ.objects.get(id=pk)

    if request.method == "POST":
        faq.delete()
        return redirect('faqs')

    return render(request, 'employees/delete.html', {'obj': faq})

@login_required(login_url='login')
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

@login_required(login_url='login')
def remove_pitch(request, pk):
    pitch = Pitch.objects.get(id=pk)

    if request.method == "POST":
        pitch.delete()
        return redirect('pitches')

    return render(request, 'employees/delete.html', {'obj': pitch})

@login_required(login_url='login')
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

@login_required(login_url='login')
def profile(request, pk):
    employee = Employee.objects.get(id=pk)
    context = {
        'employee': employee,
    }
    return render(request, 'employees/profile.html', context)

@login_required(login_url='login')
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

@login_required(login_url='login')
def volunteers(request):
    volunteers = Volunteer.objects.all()

    volunteer_count = volunteers.count()
    
    context = {
        'volunteers': volunteers,
        'volunteer_count': volunteer_count,
    }
    return render(request, 'employees/volunteers.html', context)

@login_required(login_url='login')
def remove_volunteer(request, pk):
    volunteer = Volunteer.objects.get(id=pk)

    if request.method == "POST":
        volunteer.delete()
        return redirect('volunteers')

    return render(request, 'employees/delete.html', {'obj': volunteer})

@login_required(login_url='login')
def available_vols(request):
    volunteers = Volunteer.objects.filter(available=True) 

    volunteer_count = volunteers.count()
    
    context = {
        'volunteers': volunteers,
        'volunteer_count': volunteer_count,
    }
    return render(request, 'employees/volunteers.html', context)

@login_required(login_url='login')
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

@login_required(login_url='login')
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

def view_event_log(request):
    pass

        
        