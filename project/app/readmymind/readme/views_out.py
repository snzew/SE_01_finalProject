from django.shortcuts import render
from . models import Places, Attributes, PlacesAttributes
from . serializer import PlaceSerializer, AttributeSerializer, PlacesAttributesSerializer
from numpy import random
from rest_framework import generics
from django.db.models import Count
from rest_framework.renderers import TemplateHTMLRenderer
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view, renderer_classes

"""
@api_view(['GET', 'POST'])
@renderer_classes((TemplateHTMLRenderer,))
def showattributes(request):
    
    # show bubbles of random attributes to select from user
    
    if request.method == 'GET':
        attributes = Attrib.objects.all()
        attributes = set(random.choice(attributes, 1))
        data = {'attributes': attributes}

        return Response(data, template_name='readme/base.html')
"""


def get(self, request):
    excluded = self.request.query_params.get('excluded', '').split(',')
    attributes = Attributes.objects.all()

    # checking if there is excluded attribute_ids
    if len(excluded) > 0 and len(excluded[0]) > 0:
        attributes.exclude(id__in=excluded)

    attributes = set(random.choice(attributes, 15))
    serializer = AttributeSerializer(attributes, many=True)

    return Response({'attributes': serializer.data})












class Placestest(APIView):
    serializer_class = AttributeSerializer


    # serializer_class = PlaceSerializer

    def get(self, request):
        places = Attributes.objects.all()
        places = set(random.choice(places, 10))

        return Response({'places': places})


class Attributestest(APIView):
    renderer_class = [TemplateHTMLRenderer]
    template_name = 'readme/base.html'

    def get(self, request):
        attributes = Attributes.objects.all()
        attributes = set(random.choice(attributes, 10))

        return Response({'attributes': attributes})


class SelectAttributes(APIView):
    """
    select random attributes to show the user
    so they can show they prefrences
    """

    renderer_class = [TemplateHTMLRenderer]
    template_name = 'readme/base.html'

    def get(self, request):

        excluded = self.request.query_params.get('excluded', '').split(',')
        attributes = Attributes.objects.all()

        # checking if there is excluded attribute_ids
        if len(excluded) > 0 and len(excluded[0]) > 0:
            attributes.exclude(id__in=excluded)

        attributes = set(random.choice(attributes, 20))

        return Response({'attributes': attributes})


class PlacesList(generics.ListAPIView):
    """
    show places selected based on attributes in descending order
    from most to less applicable
    """

    serializer_class = PlacesAttributesSerializer

    def get_queryset(self):
        # filter places based on selected attributes and order them from most connected attributes to less
        keywords = self.request.query_params.get('keywords', '').split(',')
        place_ids = PlacesAttributes.objects.all()\
            .filter(attributes_id__in=keywords)\
            .values('place_id')\
            .annotate(total_attributes=Count("place_id"))\
            .order_by("-total_attributes")\
            .values_list('place_id')

        # defining clause for maintaining the order from places(mos to less applicable)
        clauses = ' '.join(['WHEN id=%s THEN %s' % (id, i) for i, id in enumerate(place_ids)]).replace(',', '')
        order = 'CASE %s END' % clauses
        # filtering queryset based on returned keywords
        queryset = Places.objects.filter(id__in=place_ids).extra(select={'order': order}, order_by='order')

        return queryset
