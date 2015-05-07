from django.shortcuts import render
from refractiveindexdatabase.models import Element, Category, Elementlist
from refractiveindexdatabase.serializers import ElementSerializer, ElementListSerializer
from rest_framework.views import APIView
from rest_framework.response import Response


def identify_url_space(url):
    return url.replace("%20", " ")


class Elementitems(APIView):
    def get(self, request, categoryname, format=None):
        categoryname = identify_url_space(categoryname)
        if categoryname == 'all':
            elementlist = self._get_all_elementlist()
            serializer = ElementSerializer(elementlist, many=True)
            return Response(serializer.data)
        else:
            elementlist = self._get_elementlist(categoryname)
            serializer = ElementSerializer(elementlist, many=True)
            return Response(serializer.data)

    def _get_elementlist(self, categoryname):
        category = self._get_category(categoryname)
        return Element.objects.filter(category=category).all()

    def _get_all_elementlist(self):
        return Element.objects.all()

    @staticmethod
    def _get_category(categoryname):
        return Category.objects.filter(title=categoryname).first()


class ElementListItems(APIView):
    def get(self, request, elementname, format=None):
        elementname = identify_url_space(elementname)
        elementlistitems = self._get_elementlistitems(elementname)
        serializer = ElementListSerializer(elementlistitems, many=True)
        return Response(serializer.data)

    def _get_elementlistitems(self, elementname):
        element = self._get_element(elementname)
        return Elementlist.objects.filter(element=element).all()

    @staticmethod
    def _get_element(elementname):
        return Element.objects.filter(title=elementname).first()


class ElementListItemsDetail(APIView):
    def get(self, request, pk, format=None):
        elementlistitemsdetail = self._get_elementlistitemsdetail(pk)
        url = elementlistitemsdetail.datalink
        doc = self._read_yaml_file_from_url(url)
        doc["ELEMENT"] = elementlistitemsdetail.element.title
        doc["PAPER"] = elementlistitemsdetail.title
        return Response(doc)

    @staticmethod
    def _get_elementlistitemsdetail(pk):
        return Elementlist.objects.filter(id=pk).first()

    @staticmethod
    def _read_yaml_file_from_url(url):
        import yaml
        from urllib.request import urlopen
        file_to_be_parsed = urlopen(url)
        doc = yaml.load(file_to_be_parsed)
        return doc


def database_directory_page(request):
    return render(request, 'database_directory.html', {'tabindex': 1})


def index_app_page(request):
    return render(request,'indexapp.html')