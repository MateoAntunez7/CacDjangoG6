from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('contacto/', views.contacto, name='contacto'),
    path('nosotros/', views.nosotros, name='nosotros'),
    path('tratamientos/', views.tratamientos, name='tratamientos'),
    #path('tratamientos/listado', views.tratamientos_listado, name='tratamientos_listado'),
    path('experiencias/', views.experiencias, name='experiencias')
]