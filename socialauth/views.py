from django.shortcuts import redirect, render
from django.contrib.auth import logout as auth_logout


def logout(request):
    auth_logout(request)
    return redirect('/')

def login(request):
    return render(request, 'login.html')
