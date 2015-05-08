from django.shortcuts import render


def guide_page(request):
    return render(request, 'guide_page.html')