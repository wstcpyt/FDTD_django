__author__ = 'yutongpang'
from rest_framework import serializers
from refractiveindexdatabase.models import Element, Elementlist


class ElementSerializer(serializers.ModelSerializer):
    class Meta:
        model = Element
        fields = ('title',)


class ElementListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Elementlist
        fields = ('id', 'title')