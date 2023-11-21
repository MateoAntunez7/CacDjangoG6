from django.urls import path, re_path
from django.contrib.auth import views as auth_views
from . import views

urlpatterns = [
    path('', views.index, name='index'),

    path('accounts/login/', auth_views.LoginView.as_view(template_name='turnos/login.html'),name='login'),
    path('accounts/logout/', auth_views.LogoutView.as_view(), name='logout'),


    path('contacto/', views.contacto, name='contacto'),
    path('nosotros/', views.nosotros, name='nosotros'),
    path('indexapp/', views.indexapp, name='indexapp'),
    path('tratamientos/', views.tratamientos, name='tratamientos'),
    path('experiencias/', views.experiencias, name='experiencias'),

    path('tratamientos/alta', views.TratamientoCreateView.as_view(), name='tratamientos_alta'),
    path('tratamientos/listado', views.TratamientoListView.as_view(), name='tratamientos_listado'),
    path('tratamientos/editar/<int:pk>', views.TratamientoUpdateView.as_view(), name='tratamientos_editar'),
    path('tratamientos/eliminar/<int:pk>', views.TratamientoDeleteView.as_view(), name='tratamientos_eliminar'),
    
    path('calendario/genera', views.calendario_genera, name='calendario_genera'),        
        
    #path('agenda/turnos', views.TurnosListView.as_view(), name='turnos_listado'),
    path('agenda/turnos/<int:profesional_id>', views.TurnosListView.as_view(), name='turnos_listado'),
    path('agenda/iturnos', views.ProfesionalesListView.as_view(), name='iturnos_listado'),
    path('agenda/alta/<int:profesional_id>', views.TurnosCreateView.as_view(), name='turnos_alta'),
    path('turnos/editar/<int:pk>', views.TurnosUpdateView.as_view(), name='turnos_editar'),
    path('agenda/eliminar/<int:pk>', views.TurnosDeleteView.as_view(), name='turnos_eliminar'),

    #path('profesionales/<int:profesional_id>/alta-tratamientos/', views.alta_tratamientos_profesionales, name='alta_tratamientos_profesionales'),
]
