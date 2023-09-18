from django.shortcuts import render, HttpResponse
from datetime import datetime


# Create your views here.
def index(request):
    return render(request, 'turnos/index.html', {})

def contacto(request):
    return render(request, 'turnos/contactanos.html', {})

def nosotros(request):
    return render(request, 'turnos/nosotros.html', {})

def tratamientos(request):
    return render(request, 'turnos/tratamientos.html', {})

def experiencias(request):
    return render(request, 'turnos/experiencias.html', {})

def tratamientos_listado(request):

    # Esta data en el futuro vendrá de la base de datos
    listado = [
        'Rellenos con botox',
        'Peeling Facial',
        'Manicure y Pedicure',
        'Mesoterapia',
    ]

    context = {
        'nombre_usuario': 'Lorena Perez',
        'fecha': datetime.now(),
        'especialista': False,
        'listado_tratamientos': listado,
        'cant_tratamientos': len(listado),
    }

    return render(request, 'turnos/tratamientos_listado.html', context)


