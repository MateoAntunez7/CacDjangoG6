from django.shortcuts import render, HttpResponse, redirect, HttpResponseRedirect
from datetime import datetime
from .forms import ContactoForm, AltaTratamientoForm, EditarTratamientoForm, CalendarioGeneraForm, AltaTurnosForm, EditarTurnosForm, TratamientoForm, TratamientosProfesionalesForm
from django.contrib import messages
from django.urls import reverse
from django.core.mail import send_mail
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.views.generic.list import ListView
from django.urls import reverse
from .models import Tratamientos, Profesionales, Turnos, Feriados, Diainactivos
from django.urls import reverse_lazy
from django.db import connection
from datetime import datetime, timedelta
from django.db.models import F
from django.db.models import Count
from django.db.models import Count, Case, When, Value, CharField, Q
from django.db.models import Count, OuterRef, Subquery
from django.db.models.functions import Concat
#from django.contrib.auth.decorators import login_required
#from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import user_passes_test
from django.http import HttpResponseBadRequest

# Create your views here.
def index(request):
    return render(request, 'turnos/index.html', {})

def contacto(request):
    return render(request, 'turnos/contactanos.html', {})

def nosotros(request):
    return render(request, 'turnos/nosotros.html', {})

def indexapp(request):
    return render(request, 'turnos/indexapp.html', {})

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
        # return Tratamientos.objects.filter(estado='Activo')
        return Tratamientos.objects.exclude(id=0)

class TratamientoCreateView(CreateView):
    model = Tratamientos
    template_name = 'turnos/tratamientos_alta.html'
    success_url = 'listado'
    form_class = AltaTratamientoForm

class TratamientoUpdateView(UpdateView):
    model = Tratamientos
    template_name = 'turnos/tratamientos_editar.html'
    #fields = ['descripcion', 'estado']
    form_class = EditarTratamientoForm
    success_url = reverse_lazy('tratamientos_listado')
   
class TratamientoDeleteView(DeleteView):
    model = Tratamientos
    template_name = 'turnos/tratamientos_eliminar.html'
    fields = ['descripcion', 'estado']
    success_url = reverse_lazy('tratamientos_listado')

#@login_required

def es_administrador(user):
    return user.groups.filter(name='administrador').exists()

@user_passes_test(es_administrador)
def calendario_genera(request):
    opciones_profesional = [(profesional.id, profesional.apellido + ' ' + profesional.nombre) for profesional in Profesionales.objects.exclude(id=0)]

    if request.method == 'POST':
        form = CalendarioGeneraForm(request.POST, profesionales_choices=opciones_profesional)

        if form.is_valid():
            profesional_id = form.cleaned_data['profesional']
            fecha_desde = form.cleaned_data['fecha_desde']
            fecha_hasta = form.cleaned_data['fecha_hasta']
            
            accion = request.POST.get('accion')
           
            if accion == 'Generar': 
                # Validar si ya existen calendarios para el profesional y las fechas
                if Turnos.objects.filter(profesional_id=profesional_id, dia__range=(fecha_desde, fecha_hasta)).exists():
                    messages.success(request, 'Ya existen calendarios generados para el profesional en las fechas proporcionadas.')  # Agregar mensaje de éxito
                else:
                    with connection.cursor() as cursor:
                        cursor.callproc('sp_gcalendario', [profesional_id, fecha_desde, fecha_hasta])
                        messages.success(request, 'Calendario generado exitosamente.')  # Agregar mensaje de éxito
                        # Procesar el resultado si es necesario
                        # result = cursor.fetchall()

            elif accion == 'Eliminar':

                exito, mensaje = existe_turno(profesional_id, fecha_desde, fecha_hasta)
                # Hacer algo con la respuesta, por ejemplo, mostrar en el template
                if exito:
                    messages.success(request, mensaje)
                else:
                    messages.error(request, mensaje)

    else:
        # Obtener opciones para el campo profesional desde la base de datos
        form = CalendarioGeneraForm(profesionales_choices=opciones_profesional)

    return render(request, 'turnos/calendario_genera.html', {'form': form})


def existe_turno(profesional_id, dia_desde, dia_hasta):
    try:
        # Verificar si hay algún turno con paciente diferente de cero en el rango especificado
        turno_con_paciente = Turnos.objects.filter(
            profesional_id=profesional_id,
            dia__range=(dia_desde, dia_hasta),
            paciente_id__gt=0
        ).exists()

        if turno_con_paciente:
            # Informar que no se puede eliminar debido a la existencia de turnos con pacientes
            return False, "No se puede eliminar el calendario porque hay turnos con pacientes en el rango especificado."
        else:

        # Obtener todos los turnos del profesional en el rango especificado sin paciente
           turnos_a_eliminar = Turnos.objects.filter(
            profesional_id=profesional_id,
            dia__range=(dia_desde, dia_hasta),
            paciente_id=0
        )

        # Eliminar los turnos encontrados
        turnos_a_eliminar.delete()

        # Informar exitosamente
        return True, "Calendario eliminado exitosamente."
    except Exception as e:
        # Capturar excepciones y devolver un mensaje de error
        return False, f"Error al eliminar el calendario: {str(e)}"

class TurnosListView(ListView):
    model = Turnos
    context_object_name = 'turnos_listado'
    template_name = 'turnos/turnos_listado.html'
    ordering = ['id'] 

    def get_queryset(self):
        profesional_id = self.kwargs['profesional_id']
        return Turnos.objects.filter(profesional=profesional_id)

    def get_context_data(self, **kwargs):
        context = super(TurnosListView, self).get_context_data(**kwargs)
        profesional_id = self.kwargs['profesional_id']

  
        # Obtén la fecha y hora actual en Python
        fecha_actual = datetime.now()

        # Realiza tu consulta independiente a la tabla Turnos aquí para el conjunto 'libre'
        libre = Turnos.objects.filter(
            dia__range=[fecha_actual, fecha_actual + timedelta(days=30)],
            paciente=0,
            profesional=profesional_id
        ).exclude(
            dia__in=Feriados.objects.values('dia')
        ).exclude(
            dia__in=Subquery(Diainactivos.objects.filter(profesional=OuterRef('profesional')).values('diadesde')[:1])
        ).values(
            'profesional',
            'dia'
        ).annotate(
            libres=Count('id')
        ).order_by(
            'profesional', 'dia'
        )

        # Formatea las fechas en el formato deseado ('%d/%m/%Y') en Python
        for item in libre:
            item['dia'] = item['dia'].strftime('%d/%m/%Y')

        # Agrega los resultados de la consulta 'libre' al contexto con el nombre 'libre'
        context['libre'] = libre
        

         # Agrega el queryset de Turnos al contexto con el nombre 'turnos_listado'
        context['turnos_listado'] = Turnos.objects.filter(profesional=profesional_id,dia__gte=fecha_actual).annotate(
            apellido_profesional=F('profesional__apellido'),
            nombre_paciente=Concat('paciente__apellido', Value(' '), 'paciente__nombre'),
            descripcion_tratamiento=F('tratamiento__descripcion'),            
            tipo_turno=Case(
                When(tipo='Turno', then=Value('T')),
                When(tipo='STurno', then=Value('ST')),
                When(tipo='STurnE', then=Value('TE')),
                default=Value('PR'),
                output_field=CharField()
            ),
            id_profesional=F('profesional'),
            id_tratamiento=F('tratamiento')
         ).exclude(
            dia__in=Feriados.objects.values('dia')
        ).exclude(
            dia__in=Subquery(Diainactivos.objects.filter(profesional=OuterRef('profesional')).values('diadesde')[:1])
        ).order_by('anio', 'dia', 'hora', 'profesional')

      # Obtiene un único valor de profesional_id con apellido y nombre
        profesional_unico = Turnos.objects.filter(
        profesional=profesional_id
        ).values('profesional', 'profesional__apellido', 'profesional__nombre').first()

        # Agrega el profesional único al contexto
        context['profesional_unico'] = profesional_unico if profesional_unico else None
        
        return context

class ProfesionalesListView(ListView):
    template_name = 'turnos/iturnos_listado.html'
    context_object_name = 'profesionales'

    def get_queryset(self):
        return Turnos.objects.filter(            
            Q(dia__gte=datetime.now()) &
            Q(profesional__estado='Activo') &
            Q(profesional__apellido__isnull=False) &
            ~Q(profesional__id=0)
            
        ).order_by('profesional__apellido').distinct().values('profesional__id', 'profesional__apellido', 'profesional__nombre')
    

    

class TurnosDeleteView(DeleteView):
    model = Turnos
    template_name = 'turnos/turnos_eliminar.html'
    fields = ['id']
    success_url = reverse_lazy('iturnos_listado')

    def delete(self, request, *args, **kwargs):
        # Obtén la instancia del turno que se va a eliminar
        turno = self.get_object()

        if turno.tipo == 'Turno':
            # Si el tipo es 'Turno', asigna un valor específico (como 0) a los campos paciente y tratamiento
            turno.paciente_id = 0  # o el valor que desees asignar
            turno.tratamiento_id = 0  # o el valor que desees asignar

            # Guarda los cambios en la base de datos
            turno.save()
        else:
            # Si el tipo no es 'Turno', asigna 0 a los campos paciente_id y tratamiento_id y guarda los cambios
            turno.paciente_id = 0
            turno.tratamiento_id = 0
            turno.save()

            super().delete(request, *args, **kwargs)

        return HttpResponseRedirect(self.success_url)


class TurnosUpdateView(UpdateView):
   model = Turnos
   template_name = 'turnos/turnos_editar.html'
   form_class = EditarTurnosForm
   success_url = reverse_lazy('iturnos_listado')

    
class TurnosCreateView(CreateView):
    model = Turnos
    template_name = 'turnos/turnos_alta.html'
    form_class = AltaTurnosForm
    success_url = reverse_lazy('iturnos_listado')  # Reemplaza 'nombre_de_tu_url' con el nombre de la URL a la que deseas redirigir

    def form_valid(self, form):
        # Antes de guardar el formulario, establecemos el valor del campo 'anio'
        form.instance.anio = form.cleaned_data['dia'].year
        form.instance.mes = form.cleaned_data['dia'].month

        # Validar si el día está marcado como inactivo
        if self.dia_esta_inactivo(form.cleaned_data['dia'], form.cleaned_data['profesional']):
            return HttpResponseBadRequest("El día seleccionado está cargado como inactivo.")
        
        # Validar si el día está marcado como feriado
        if self.dia_esta_feriado(form.cleaned_data['dia']):
            return HttpResponseBadRequest("El día seleccionado está cargado como feriado.")

        return super().form_valid(form)
    
    def dia_esta_inactivo(self, dia, profesional):
        # Verificar si el día está marcado como inactivo para el profesional
        return Diainactivos.objects.filter(diadesde=dia, profesional=profesional).exists()
    
    def dia_esta_feriado(self, dia):
        # Verificar si el día está marcado como inactivo para el profesional
        return Feriados.objects.filter(dia=dia).exists()
    

def alta_tratamientos_profesionales(request, profesional_id):
    profesional = Profesionales.objects.get(id=profesional_id)

    if request.method == 'POST':
        tratamiento_form = TratamientoForm(request.POST)
        tratamientos_profesionales_form = TratamientosProfesionalesForm(request.POST)

        if tratamiento_form.is_valid() and tratamientos_profesionales_form.is_valid():
            tratamiento = tratamiento_form.save()
            tratamiento_profesional = tratamientos_profesionales_form.save(commit=False)
            tratamiento_profesional.profesional = profesional
            tratamiento_profesional.tratamiento = tratamiento
            tratamiento_profesional.save()

            return redirect('vista_detalle_profesional', profesional_id=profesional.id)
    else:
        tratamiento_form = TratamientoForm()
        tratamientos_profesionales_form = TratamientosProfesionalesForm()

    return render(
        request,
        'tratamientos_profesional.html',
        {'tratamiento_form': tratamiento_form, 'tratamientos_profesionales_form': tratamientos_profesionales_form}
    )