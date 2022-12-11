from django.urls import path
from . import views
from employees import views as emp_views

urlpatterns = [
    path('', views.home, name='visitor-home'),
    path('about/', views.about, name='about'),
    path('donate/', views.donate, name='donate'),
    path('donate-blood/', views.donate_blood, name='donate-blood'),
    path('subscribe/', views.subscribe, name='subscribe'),
    path('contact-us/', views.contact_us, name='contact-us'),  # create pitch
    path('faqs/', emp_views.faqs, name='vis-faqs'),
    path('ask-question/', views.ask_question, name='ask-question'),
    path('blogs/', emp_views.all_posts, name='vis-blogs'),
    path('departments/', emp_views.departments, name='vis-departments'),
    path('drives/', emp_views.drives, name='vis-drives'),
    path('past-drives/', emp_views.past_drives, name='vis-past-drives'),
    path('our-team', emp_views.team, name='vis-team'),
    path('become-volunteer/', views.become_volunteer, name='become-volunteer'),
]