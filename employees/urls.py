from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('', views.home, name='emp-home'),
    path('login/', views.LoginView, name='login'),
    path('register/', views.register, name='register'),
    path('logout/', views.LogoutView, name='logout'),

    path('password-reset/',
          auth_views.PasswordResetView.as_view(template_name='employees/password_reset.html'),
           name='password_reset'), # form
    path('password-reset-done/', 
    auth_views.PasswordResetDoneView.as_view(template_name='employees/password_reset_sent.html'),
     name='password_reset_done'), # message
    path('password-reset-confirm/<uidb64>/<token>/',
     auth_views.PasswordResetConfirmView.as_view(template_name='employees/password_reset_form.html'),
      name='password_reset_confirm'), # form 
    path('password-reset-complete/',
     auth_views.PasswordResetCompleteView.as_view(template_name='employees/password_reset_complete.html'),
     name='password_reset_complete'), # message

    path('posts/', views.all_posts, name='all-posts'),
    path('post/<str:pk>/', views.post, name='post'),
    path('create-post/', views.create_post, name='create-post'),
    path('update-post/<str:pk>/', views.update_post, name='update-post'),
    path('delete-post/<str:pk>/', views.delete_post, name='delete-post'),
    
    path('departments/', views.departments, name='departments'),  # list of departments(by clicking on
    # each department, we go to a page which shows benificiaries of that particular department)
    path('create-department/', views.create_department, name='create-department'), 
    path('update-department/<str:pk>/', views.update_department, name='update-department'), 
    path('remove-department/<str:pk>/', views.remove_department, name='remove-department'),
    path('view-department-beneficiaries/<str:pk>/', views.view_department_beneficiaries, name='view-department-beneficiaries'),
    
    path('benificiaries/', views.benificiaries, name='benificiaries'),
    path('create-benificiary/', views.create_benificiary, name='create-benificiary'), 
    path('update-benificiary/<str:pk>/', views.update_benificiary, name='update-benificiary'),
    path('remove-benificiary/<str:pk>/', views.remove_benificiary, name='remove-benificiary'),
    
    path('donors/', views.donors, name='donors'),
    path('blood-donations/', views.blood_donations, name='blood-donations'),
    path('donations/', views.donations, name='donations'),


    path('subscribers/', views.subscribers, name='subscribers'),
    path('delete-subscriber/<str:pk>/', views.delete_subscriber, name='delete-subscriber'),

    path('drives/', views.drives, name='drives'),
    path('create-drive/', views.create_drive, name='create-drive'),
    path('update-drive/<str:pk>/', views.update_drive, name='update-drive'),
    path('terminate-drive/<str:pk>/', views.terminate_drive, name='terminate-drive'),

    path('past-drives/', views.past_drives, name='past-drives'),
    path('update-past-drive/<str:pk>/', views.update_past_drive, name='update-past-drive'),

    path('ambulances/', views.ambulances, name='ambulances'),
    path('add-ambulances/', views.add_ambulance, name='add-ambulance'),
    path('update-ambulance/<str:pk>/', views.update_ambulance, name='update-ambulance'),
    path('remove-ambulance/<str:pk>/', views.remove_ambulance, name='remove-ambulance'),

    path('inventory/', views.inventory, name='inventory'),
    path('add-to-inventory/', views.add_item, name='add-to-inventory'),
    path('update-item/<str:pk>/', views.update_item, name='update-item'),
    path('deliver-item/<str:pk>/', views.deliver_item, name='deliver-item'),

    path('dispensary/', views.dispensary, name='dispensary'),
    path('add-to-dispensary/', views.add_med_item, name='add-to-dispensary'),
    path('update-dispensary-item/<str:pk>/', views.update_med_item, name='update-dispensary-item'),
    path('deliver-dispensary-item/<str:pk>/', views.deliver_med_item, name='deliver-dispensary-item'),

    path('blood-bank/', views.blood_bank, name='blood-bank'),
    path('add-to-blood-bank/', views.add_blood_item, name='add-to-blood-bank'),
    path('deliver-blood-item/<str:pk>/', views.deliver_blood_item, name='deliver-blood-item'),

    path('faqs/', views.faqs, name='faqs'),
    path('answer-question/<str:pk>/', views.answer_question, name='answer-question'),
    path('remove-faq/<str:pk>/', views.remove_faq, name='remove-faq'),

    path('pitches/', views.pitches, name='pitches'),  # contact us table
    path('remove-pitch/<str:pk>/', views.remove_pitch, name='remove-pitch'),

    path('team/', views.team, name='team'),
    path('profile/<str:pk>', views.profile, name='profile'),
    path('edit-profile/<str:pk>/', views.edit_personal_profile, name='edit-profile'),

    path('volunteers/', views.volunteers, name='volunteers'),
    path('volunteers/remove-volunteer/<str:pk>/', views.remove_volunteer, name='remove-volunteer'),
    path('volunteers/available/', views.available_vols, name='available-volunteers'),
    path('volunteers/make-available/<str:pk>/', views.make_vol_available, name='make-vol-available'),
    path('volunteers/make-unavailable/<str:pk>/', views.make_vol_unavailable, name='make-vol-unavailable'),
]