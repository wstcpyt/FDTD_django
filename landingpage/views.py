from django.shortcuts import render

# Create your views here.


def home_page(request):
    return render(request, 'home_page.html')

def database_directory_page(request):
    return render(request, 'database_directory.html')