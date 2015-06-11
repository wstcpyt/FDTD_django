__author__ = 'yutongpang'
from rest_framework import serializers
from fdtdonthecloud.models import FDTDProject


class FDTDProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = FDTDProject
        fields = ('id', 'title', 'layerdetail',)

    def create(self, validated_data):
        return FDTDProject.objects.create(**validated_data)

    def update(self, instance, validated_data):
        instance.title = validated_data.get('title', instance.title)
        try:
            instance.layerdetail.update({str(validated_data['layernumber']): validated_data.get('layerdetail', instance.layerdetail)})
        except KeyError:
            instance.layerdetail[validated_data['layernumber']] = validated_data.get('layerdetail', instance.layerdetail)
        instance.save()
        return instance
