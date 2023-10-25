from django.shortcuts import render, HttpResponse, redirect
from datetime import datetime
from .forms import ContactoForm
from django.contrib import messages
from django.urls import reverse
from django.core.mail import EmailMessage
from django.core.mail import send_mail
from django.views.generic.edit import CreateView
from django.views.generic.list import ListView
from django.db import IntegrityError
from django.http import HttpResponse
from django.urls import reverse
from .models import Tratamientos


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

def contacto(request):
    if request.method == "POST":
        # Instanciamos un formulario con datos
        formulario = ContactoForm(request.POST)

        # Validarlo
        if formulario.is_valid():
            # Dar de alta la info

            nombre=request.POST.get("nombre")
            mail=request.POST.get("mail")
            telefono=request.POST.get("telefono")
            mensaje=request.POST.get("mensaje")

            asunto = f'Mensaje de {nombre} ({mail})'
            mensaje_correo = f'Mensaje de: {nombre}\nCorreo: {mail}\n\n{mensaje}'
            remitente = 'info@dermatologiamcc.com.ar'  # Reemplaza con tu correo
            destinatario = ['jumafeit@gmail.com']  # Reemplaza con el correo de destino

            send_mail(asunto, mensaje_correo, remitente, destinatario)

            messages.info(request, "Consulta enviada con éxito")
            return redirect(reverse("contacto"))

    else: # GET
        formulario = ContactoForm()

    context = {
        'contacto_form': formulario
    }

    return render(request, 'turnos/contactanos.html', context)


class TratamientoCreateView(CreateView):
    model = Tratamientos
    template_name = 'turnos/alta_tratamientos.html'
    success_url = 'listado'
    fields = '__all__'


    #def form_valid(self, form):
        # Puedes realizar acciones adicionales antes de guardar el formulario si es necesario
        # Por ejemplo, asignar valores adicionales al objeto antes de guardarlo en la base de datos.
    #    return super().form_valid(form)
    

class TratamientoListView(ListView):
    model = Tratamientos
    context_object_name = 'listado_tratamientos'
    template_name = 'turnos/tratamientos_listado.html'
    ordering = ['descripcion'] 

    def get_queryset(self):
        # Define aquí la lógica para obtener el conjunto de consultas según tus necesidades
        # Por ejemplo, podrías querer filtrar los tratamientos de acuerdo a ciertos criterios
         return Tratamientos.objects.filter(estado='Activo')