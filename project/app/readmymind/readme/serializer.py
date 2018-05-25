from . models import Places, Attributes, PlacesAttributes
from rest_framework import serializers


class PlaceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Places
        fields = '__all__'
        #fields = ('id', 'google_place_id', 'name', 'rating', 'address', 'lat', 'lng', 'types', 'city', 'website')


class AttributeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Attributes
        fields = ('id', 'name')


class PlacesAttributesSerializer(serializers.ModelSerializer):
    class Meta:
        model = PlacesAttributes
        fields = ('id', 'place_id', 'attribute_id')