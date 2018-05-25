from . import views
from django.conf.urls import url


urlpatterns = [
    url('^attributes', views.AttributesList.as_view(), name='attributes'),
    url('^places', views.PlacesSelection.as_view(), name='places'),
]


