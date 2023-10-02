from django.shortcuts import render, HttpResponse, redirect
from datetime import datetime
from .forms import ContactoForm
from django.contrib import messages
from django.urls import reverse
from django.core.mail import EmailMessage
from django.core.mail import send_mail



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


#def tratamientos_listado(request):

    # Esta data en el futuro vendrá de la base de datos
#    listado = [
#        'Rellenos con botox',
#        'Peeling Facial',
#        'Manicure y Pedicure',
#        'Mesoterapia',
#    ]

#    context = {
#        'nombre_usuario': 'Lorena Perez',
#        'fecha': datetime.now(),
#        'especialista': False,
#        'listado_tratamientos': listado,
#        'cant_tratamientos': len(listado),
#    }

#    return render(request, 'turnos/tratamientos_listado.html', context)


