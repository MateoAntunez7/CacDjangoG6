from django import forms
from django.core.exceptions import ValidationError


#class BlueBackgroundTextInput(forms.TextInput):
 #   class Media:
  #      CSS = {'all': ('core/css/blue_background_text_input.css',)}

class ContactoForm(forms.Form):
    nombre = forms.CharField(label="Nombre de contacto", required=True)
    mail = forms.EmailField(label="Mail", required=True)
    telefono = forms.CharField(label="telefono")
    mensaje =  forms.CharField(widget=forms.Textarea(attrs={'class': 'message-box'}))