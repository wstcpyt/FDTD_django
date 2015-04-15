from django.shortcuts import render
from refractiveindexdatabase.models import Category


def database_directory_page(request):
    category = Category.objects.all()
    return render(request, 'database_directory.html', {'category': category})
