from django.shortcuts import render
from rest_framework.views import APIView
from guide.serializers import ReleaseversionsSerializer
from guide.models import ReleaseVersion
from rest_framework.response import Response


def guide_page(request):
    return render(request, 'guide_page.html')


class Releaseversions(APIView):
    def get(self, request, format=None):
        releaseversion = ReleaseVersion.objects.all()
        serializer = ReleaseversionsSerializer(releaseversion, many=True)
        return Response(serializer.data)
