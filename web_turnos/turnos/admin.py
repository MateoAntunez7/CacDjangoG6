from typing import Any
from django.contrib import admin
from django.db.models.fields.related import ManyToManyField
from django.forms.models import ModelMultipleChoiceField
from django.http.request import HttpRequest

# Register your models here.
from turnos.models import Tratamientos, Profesionales, TratamientosProfesionales, Especialidades,Feriados,Obrasociales,Diainactivos,Diahoras,Pacientes,Turnos,HistoriasClinicas


class TratamientosAdmin(admin.ModelAdmin):
    list_display = ['descripcion', 'estado']
    search_fields = ['descripcion']

admin.site.register(Tratamientos, TratamientosAdmin)

class TratamientosProfesionalesInline(admin.TabularInline):
    model = Profesionales.tratamiento.through
    extra = 1

class ProfesionalesAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'apellido', 'especialidad', 'intervalos', 'sobreturno', 'sobreturnoe', 'estado')
    inlines = [TratamientosProfesionalesInline]

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'tratamiento':
            kwargs["queryset"] = Tratamientos.objects.all().order_by("descripcion")
        return super().formfield_for_manytomany(db_field, request, **kwargs)

admin.site.register(Profesionales, ProfesionalesAdmin)


admin.site.register(TratamientosProfesionales)
admin.site.register(Especialidades)
admin.site.register(Feriados)
admin.site.register(Obrasociales)
admin.site.register(Diainactivos)
admin.site.register(Diahoras)
admin.site.register(Pacientes)
admin.site.register(Turnos)
admin.site.register(HistoriasClinicas)