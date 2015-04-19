from django.shortcuts import render
from refractiveindexdatabase.models import Element, Category
from refractiveindexdatabase.serializers import CategorySerializer
from rest_framework.views import APIView
from rest_framework.response import Response


class ElementList(APIView):
    def get(self, request, categoryname, format=None):
        categoryname = self._identify_url_space(categoryname)
        elementlist = self._get_elementlist(categoryname)
        serializer = CategorySerializer(elementlist, many=True)
        return Response(serializer.data)

    def _get_elementlist(self, categoryname):
        category = self._get_category(categoryname)
        return Element.objects.filter(category=category).all()

    def _identify_url_space(self, categoryname):
        return categoryname.replace("%20", " ")

    @staticmethod
    def _get_category(categoryname):
        return Category.objects.filter(title=categoryname).first()


def database_directory_page(request):
    category = Category.objects.all()
    return render(request, 'database_directory.html', {'category': category})