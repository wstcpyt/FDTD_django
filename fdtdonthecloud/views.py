from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from rest_framework.views import APIView
from fdtdonthecloud.serializers import FDTDProjectSerializer
from fdtdonthecloud.models import FDTDProject
from rest_framework.response import Response
from rest_framework import status
from django.http import QueryDict


@login_required(login_url='/login/')
def fdtdapp(request):
    return render(request, 'fdtdapp.html')


class FDTDProjectView(APIView):
    def post(self, request, format=None):
        querydata = self._getQuerydata(request)
        serializer = FDTDProjectSerializer(data=querydata)
        if serializer.is_valid():
            serializer.save(user=request.user)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def put(self, request, format=None):
        querydata = self._getQuerydata(request)
        fdtdproject = FDTDProject.objects.get(id=14)
        serializer = FDTDProjectSerializer(fdtdproject, data=querydata, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @staticmethod
    def _getQuerydata(request):
        if isinstance(request.data, QueryDict):
            querydata = request.data.dict()
        else:
            querydata = request.data
        return querydata
