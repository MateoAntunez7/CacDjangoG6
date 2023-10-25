from django.urls import path, re_path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('contacto/', views.contacto, name='contacto'),
    path('nosotros/', views.nosotros, name='nosotros'),
    path('tratamientos/', views.tratamientos, name='tratamientos'),
    path('experiencias/', views.experiencias, name='experiencias'),

    path('tratamientos/alta', views.TratamientoCreateView.as_view(), name='alta_tratamientos'),
    path('tratamientos/listado', views.TratamientoListView.as_view(), name='tratamientos_listado'),
    
]