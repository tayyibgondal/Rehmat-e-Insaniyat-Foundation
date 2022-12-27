from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='visitor-home'),
    path('about/', views.about, name='about'),
    path('donate/', views.donate, name='donate'),
    path('donate-blood/', views.donate_blood, name='donate-blood'),
    path('subscribe/', views.subscribe, name='subscribe'),
    path('contact-us/', views.contact_us, name='contact-us'),  # create pitch
    path('become-volunteer/', views.become_volunteer, name='become-volunteer'),
    path('ask-question/', views.ask_question, name='ask-question'),
    path('faqs/', views.faqs, name='vis-faqs'),
    path('blogs/', views.all_posts, name='vis-blogs'),
    path('post/<str:pk>/', views.post, name='vis-post'),
    path('departments/', views.departments, name='vis-departments'),
    path('drives/', views.drives, name='vis-drives'),
    path('past-drives/', views.past_drives, name='vis-past-drives'),
    path('our-team', views.team, name='vis-team'),
    path('profile/<str:pk>', views.profile, name='vis-profile'),
]