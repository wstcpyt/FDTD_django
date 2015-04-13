from django.shortcuts import render


def database_directory_page(request):
    return render(request, 'database_directory.html')
