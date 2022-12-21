from django.http import HttpResponse
from django.shortcuts import redirect, render

# def allowed_users(allowed_roles=[]):
#     def decorator(view_func):
#         def wrapper(request, *args, **kwargs):
#             group = None
#             print(request.user.groups.all())
#             if request.user.groups.exists():
#                 group = request.user.groups.all()[0].name
#                 print(group)
#             if group in allowed_roles:
#                 return view_func(request, *args, **kwargs)
#             else:
#                 return HttpResponse('403 Forbidden!')
#         return wrapper
#     return decorator

def forbid(view_func):
    def wrapper(request, *args, **kwargs):
        print()
        if (not request.user.is_authenticated and 
            request.resolver_match.url_name[0:3] != 'vis'):
            return render(request, 'forbidden_403.html')
        else:
            return view_func(request, *args, **kwargs)
    return wrapper