from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .forms import (CustomUserCreationForm, CustomUserChangeForm,
                    AmbulanceAdditionForm, AmbulanceUpdationForm)
from .models import Employee, Ambulance
from . import models

@admin.action(description='Mark selected drivers as Unavailabe')
def make_unavailable(modeladmin, request, queryset):
    for ambulance in queryset:
        driver = ambulance.driver
        driver.available = False
        driver.save()

@admin.action(description='Mark selected drivers as Available')
def make_available(modeladmin, request, queryset):
    for ambulance in queryset:
        driver = ambulance.driver
        driver.available = True
        driver.save()

class AmbulanceModelAdmin(admin.ModelAdmin):
    add_form = AmbulanceUpdationForm
    form = AmbulanceAdditionForm
    model = Ambulance

    list_display = ('plate_no', 'driver')
    actions = [make_available, make_unavailable]

    def delete_queryset(self, request, queryset):
        for ambulance in queryset:
            ambulance.delete()
        super().delete_queryset(request, queryset)        

class CustomUserAdmin(UserAdmin):
    ordering = '-date_joined'
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = Employee
    list_display = ('username', 'email', 'is_superuser', 'is_staff', 'is_active',)  # columns of table appearing on admin page
    list_filter = ('email', 'is_staff', 'is_active',)
    fieldsets = (
        (None, {'fields': ('email', 'username', 'first_name', 'last_name', 'role', 'password')}),
        ('Permissions', {'fields': ('is_staff', 'is_active', 'is_superuser')}),
        ('Personal', {'fields': ('description','available',)}),
        ('Group Permissions', {
            'classes': ('collapse',),
            'fields': ('groups', 'user_permissions', )
        }),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('first_name', 'last_name', 'username', 'email', 'role', 'password1', 'password2', 'is_staff', 'is_active')}
        ),
    )
    search_fields = ('email', 'username')
    ordering = ('date_joined',)


admin.site.register(Employee, CustomUserAdmin)
admin.site.register(models.Post)
admin.site.register(models.Topic)
admin.site.register(models.Department)
admin.site.register(models.Benificiary)
admin.site.register(models.Donor)
admin.site.register(models.Donation)
admin.site.register(models.BloodDonation)
admin.site.register(models.Drive)
admin.site.register(models.Subscriber)
admin.site.register(models.PastDrive)
admin.site.register(models.Ambulance, AmbulanceModelAdmin)
admin.site.register(models.Inventory)
admin.site.register(models.BloodBank)
admin.site.register(models.Dispensary)
admin.site.register(models.FAQ)
admin.site.register(models.Pitch)
admin.site.register(models.Volunteer)