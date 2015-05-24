__author__ = 'yutongpang'
from rest_framework import serializers
from guide.models import ReleaseVersion, ReleaseNote


class ReleasenotesSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReleaseNote
        fields = ('type', 'note')


class ReleaseversionsSerializer(serializers.ModelSerializer):
    releasenotes = ReleasenotesSerializer(many=True, read_only=True)

    class Meta:
        model = ReleaseVersion
        fields = ('version', 'time', 'releasenotes')
