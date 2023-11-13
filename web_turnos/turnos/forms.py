from django import forms
from django.core.exceptions import ValidationError
from .models import Tratamientos, Turnos, Profesionales, Pacientes
from django.forms.widgets import DateInput, TimeInput


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
    ('STurno', 'STurno'),
    ('STurnoE', 'STurnoE'),
   # ('Turno', 'Turno'), #porque los turnos ya están habilitados desde la agenda
    ('Practicas', 'Practicas'),
)
    
    class Meta:
        model = Turnos
        fields = ['tipo',
                  'profesional',
                  'tratamiento',
                  'paciente',
                  'dia',
                  'hora']
        
    dia = forms.DateField(widget=DateInput(attrs={'type': 'date', 'class': 'form-control'}))
    
    hora = forms.TimeField(widget=TimeInput(attrs={'type': 'time', 'class': 'form-control'}))
        
    tipo = forms.ChoiceField(choices=TIPO_CHOICES, widget=forms.Select(attrs={'class': 'form-control', 'style': 'width: 150px; height: 30px;'}))

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Excluye los profesionales con id igual a 0
        self.fields['profesional'].queryset = Profesionales.objects.exclude(id=0)

        # Excluye los profesionales con id igual a 0
        self.fields['tratamiento'].queryset = Tratamientos.objects.exclude(id=0)

        # Excluye los profesionales con id igual a 0
        self.fields['paciente'].queryset = Pacientes.objects.exclude(id=0)


class EditarTurnosForm(forms.ModelForm):
   
   class Meta:
       model = Turnos
       fields = [ 'tratamiento',
                  'paciente']
    
   def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Excluye los profesionales con id igual a 0
        self.fields['tratamiento'].queryset = Tratamientos.objects.exclude(id=0)

        # Excluye los profesionales con id igual a 0
        self.fields['paciente'].queryset = Pacientes.objects.exclude(id=0)