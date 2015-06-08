__author__ = 'yutongpang'
from rest_framework import serializers
from fdtdonthecloud.models import FDTDProject


class FDTDProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = FDTDProject
        fields = ('title',)
