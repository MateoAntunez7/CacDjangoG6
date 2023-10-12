from django.db import models

# Create your models here.

class especialidades(models.Model):
    descripcion = models.CharField(max_length=50, verbose_name="descripcion")
    estado = models.CharField(max_length=8, verbose_name="esstado") 