from . models import Places, Attributes, PlacesAttributes
from . serializer import PlaceSerializer, AttributeSerializer, PlacesAttributesSerializer
from numpy import random
from rest_framework import generics
from django.db.models import Count
from rest_framework.renderers import TemplateHTMLRenderer
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response
from rest_framework.views import APIView
from django.shortcuts import render
from rest_framework.decorators import api_view, renderer_classes


class AttributesList(APIView):

    def get(self,request):
        excluded = self.request.query_params.get('excluded', '').split(',')
        attributes = Attributes.objects.all()

        # checking if there is excluded attribute_ids
        if len(excluded) > 0 and len(excluded[0]) > 0:
            attributes.exclude(id__in=excluded)

        attributes = set(random.choice(attributes, 20))
        serializer = AttributeSerializer(attributes, many=True)

        return Response({'attributes': serializer.data})


class PlacesSelection(APIView):

    def post(self,request):
        """
        if get methode, random places are displayed

        """
        places = Places.objects.all()
        places = set(random.choice(places, 10))

        serializer = PlaceSerializer(places, many=True)

        return Response({'places': serializer.data})

    def get(self,request):
        """
        post methode show places based on selected attributes

        """
        # getting keywords form url
        keywords = self.request.query_params.get('keywords', '-1').split(',')

        print(keywords)
        # filtering database to get the right places
        place_ids = PlacesAttributes.objects.all()\
            .filter(attribute_id__in=keywords)\
            .values('place_id')\
            .annotate(total_attributes=Count("place_id"))\
            .order_by("-total_attributes")\
            .values_list('place_id')

        print(place_ids)

        # defining clause for maintaining the order from places(most to less applicable)
        clauses = ' '.join(['WHEN id=%s THEN %s' % (id, i) for i, id in enumerate(place_ids)]).replace(',', '')
        order = 'CASE %s END' % clauses

        places = Places.objects.filter(id__in=place_ids)

        serializer = PlaceSerializer(places, many=True)

        return Response({'places': serializer.data})

