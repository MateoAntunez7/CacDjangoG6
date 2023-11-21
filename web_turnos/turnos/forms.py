from django import forms
from django.core.exceptions import ValidationError
from .models import Tratamientos, Turnos, Profesionales, Pacientes, Diainactivos, Feriados, TratamientosProfesionales, Tratamientos
from django.forms.widgets import DateInput, TimeInput
from datetime import datetime
from django.utils.safestring import mark_safe
from django.db.models import Q


#class BlueBackgroundTextInput(forms.TextInput):
 #   class Media:
  #      CSS = {'all': ('core/css/blue_background_text_input.css',)}

class ContactoForm(forms.Form):
    nombre = forms.CharField(label="Nombre de contacto", required=True)
    mail = forms.EmailField(label="Mail", required=True)
    telefono = forms.CharField(label="telefono")
    mensaje =  forms.CharField(widget=forms.Textarea(attrs={'class': 'message-box'}))

class AltaTratamientoForm(forms.ModelForm):
    ESTADO_CHOICES = [
        ('Activo', 'Activo'),
        ('Inactivo', 'Inactivo'),
    ]
    
    estado = forms.ChoiceField(choices=ESTADO_CHOICES, widget=forms.Select(attrs={'class':'form-control','style': 'width: 120px; height: 30px;'}))

    class Meta:
        model = Tratamientos
        fields = ['descripcion', 'estado']

class EditarTratamientoForm(forms.ModelForm):
    ESTADO_CHOICES = [
        ('Activo', 'Activo'),
        ('Inactivo', 'Inactivo'),
    ]
    
    estado = forms.ChoiceField(choices=ESTADO_CHOICES, widget=forms.Select(attrs={'class':'form-control','style': 'width: 120px; height: 30px;'}))

    class Meta:
        model = Tratamientos
        fields = ['descripcion', 'estado']

class CalendarioGeneraForm(forms.Form):
    profesional = forms.ChoiceField(choices=(), required=True, widget=forms.Select(attrs={'style': 'width: 230px;'}))
    fecha_desde = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    fecha_hasta = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))

    def __init__(self, *args, **kwargs):
        profesionales_choices = kwargs.pop('profesionales_choices', [])
        super(CalendarioGeneraForm, self).__init__(*args, **kwargs)
        self.fields['profesional'].choices = profesionales_choices


class AltaTurnosForm(forms.ModelForm):
    TIPO_CHOICES = (
        ('STurno', mark_safe('<span style="font-size: 14px;">Sobre-Turno</span>')),
        ('STurnoE', mark_safe('<span style="font-size: 16px;">Sobre-Turno-Especial</span>')),
        ('Practicas', mark_safe('<span style="font-size: 18px;">Prácticas</span>')),
    ) 
    class Meta:
        model = Turnos
        fields = ['tipo',
                  'profesional',
                  'tratamiento',
                  'paciente',
                  'dia',
                  'hora']
        
    dia = forms.DateField(widget=forms.Select(attrs={'class': 'form-control', 'style': 'width: 200px; height: 40px;'}))
    
    hora = forms.TimeField(widget=TimeInput(attrs={'type': 'time', 'class': 'form-control', 'style': 'width: 200px; height: 40px;'}))
        
    tipo = forms.ChoiceField(choices=TIPO_CHOICES, widget=forms.Select(attrs={'class': 'form-control', 'style': 'width: 200px; height: 40px;'}))

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Excluye los profesionales con id igual a 0
        self.fields['profesional'].queryset = Profesionales.objects.exclude(id=0)

       # Excluye los tratamientos con estado 'Inactivo' y con id igual a 0
        self.fields['tratamiento'].queryset = Tratamientos.objects.exclude(Q(estado='Inactivo') | Q(id=0) | ~Q(estado='Activo'))

        # Excluye los profesionales con id igual a 0
        self.fields['paciente'].queryset = Pacientes.objects.exclude(id=0)

        # Obtener la lista de días disponibles excluyendo los días en Diainactivos y Feriados
        dias_disponibles = self.obtener_dias_disponibles()

        # Actualizar las opciones del campo 'dia'
        self.fields['dia'].widget.choices = dias_disponibles

    def obtener_dias_disponibles(self):

         # Obtén la fecha y hora actual en Python
        fecha_actual = datetime.now()

        # Obtener todos los días disponibles
        dias_turnos = Turnos.objects.filter(dia__gte=fecha_actual).values_list('dia', flat=True).distinct()

        # Obtener los días en Diainactivos y Feriados
        # No son necesarios al final porque lo restrinjo en el querie dias_turnos
        dias_inactivos = Diainactivos.objects.values_list('diadesde', flat=True)
        dias_feriados = Feriados.objects.values_list('dia', flat=True)

        # Filtrar los días disponibles excluyendo los días en Diainactivos y Feriados
        dias_disponibles = [(dia, dia.strftime('%Y-%m-%d')) for dia in dias_turnos if dia not in dias_inactivos and dia not in dias_feriados]

        return dias_disponibles

class EditarTurnosForm(forms.ModelForm):
   
   class Meta:
       model = Turnos
       fields = [ 'tratamiento',
                  'paciente']
    
   def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Excluye los tratamientos con estado 'Inactivo' y con id igual a 0
        self.fields['tratamiento'].queryset = Tratamientos.objects.exclude(Q(estado='Inactivo') | Q(id=0) | ~Q(estado='Activo'))

        # Excluye los profesionales con id igual a 0
        self.fields['paciente'].queryset = Pacientes.objects.exclude(id=0)

class TratamientosProfesionalesForm(forms.ModelForm):
    tratamientos = forms.ModelMultipleChoiceField(queryset=Tratamientos.objects.all(), widget=forms.CheckboxSelectMultiple)

    class Meta:
        model = TratamientosProfesionales
        fields = ['tratamientos']


class TratamientoForm(forms.ModelForm):
    class Meta:
        model = Tratamientos
        fields = ['descripcion', 'estado']