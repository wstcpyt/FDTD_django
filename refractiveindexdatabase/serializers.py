__author__ = 'yutongpang'
from rest_framework import serializers
from refractiveindexdatabase.models import Element


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Element
        fields = ('id', 'category', 'title')