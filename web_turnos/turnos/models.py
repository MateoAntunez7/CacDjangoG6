from django.db import models

# Create your models here.

class Especialidades(models.Model):
    descripcion = models.CharField(max_length=50, verbose_name="descripcion")
    estado = models.CharField(max_length=8, verbose_name="estado") 

    def __str__(self):
        return self.descripcion

    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'Especialidades'
        verbose_name_plural = 'Especialidades'

        
class Feriados(models.Model):
    dia = models.DateField()
    descripcion = models.CharField(max_length=50, verbose_name="descripcion")

    def __str__(self):
        return f'{self.dia} {self.descripcion}' 

    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'Feriados'
        verbose_name_plural = 'Feriados'

class Obrasociales(models.Model):
    descripcion = models.CharField(max_length=50, verbose_name="descripcion")
    estado = models.CharField(max_length=8, verbose_name="estado") 

    def __str__(self):
        return self.descripcion

    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'Obrasociales'
        verbose_name_plural = 'Obrasociales'

class Tratamientos(models.Model):
    descripcion = models.CharField(max_length=50, verbose_name="descripcion")
    estado = models.CharField(max_length=8, verbose_name="estado") 

    def __str__(self):
        return self.descripcion

    class Meta:
        db_table = 'Tratamientos'
        verbose_name_plural = 'Tratamientos'

class Profesionales(models.Model):
    apellido = models.CharField(max_length=50, verbose_name="apellido")
    nombre = models.CharField(max_length=50, verbose_name="nombre")
    telefono1 = models.CharField(max_length=50, verbose_name="telefono1")
    telefono2 = models.CharField(max_length=50, verbose_name="telefono2")
    email = models.CharField(max_length=50, verbose_name="email")
    especialidad = models.ForeignKey(Especialidades, on_delete=models.CASCADE, verbose_name="especialidad") 
    intervalos = models.TimeField(verbose_name="intervalos")
    sobreturno = models.IntegerField(verbose_name="sobreturno") 
    sobreturnoe = models.IntegerField(verbose_name="sobreturnoe")
    estado = models.CharField(max_length=8, verbose_name="estado")
    tratamiento = models.ManyToManyField(Tratamientos,through="TratamientosProfesionales")  

    def __str__(self):
        return f'{self.nombre} {self.apellido}' 

    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'Profesionales'
        verbose_name_plural = 'Profesionales'

class TratamientosProfesionales(models.Model):
    tratamiento = models.ForeignKey(Tratamientos, on_delete=models.CASCADE) 
    profesional = models.ForeignKey(Profesionales, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.profesional} - {self.tratamiento} ' 

    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'TratamientosProfesionales'
        verbose_name_plural = 'TratamientosProfesionales'

class Diainactivos(models.Model):
    diadesde = models.DateField()
    descripcion = models.CharField(max_length=50, verbose_name="descripcion")
    profesional = models.ForeignKey(Profesionales, on_delete=models.CASCADE, verbose_name="profesional") 

    def __str__(self):
        return f'{self.diadesde} - {self.descripcion} - {self.profesional}' 

    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'Diainactivos'
        verbose_name_plural = 'Diainactivos'

class Diahoras(models.Model):
    profesional = models.ForeignKey(Profesionales, on_delete=models.CASCADE, verbose_name="profesional") 
    dia = models.IntegerField(verbose_name="dia") 
    horainicio = models.TimeField(verbose_name="horainicio")
    horafin = models.TimeField(verbose_name="horafin")
     
    def __str__(self):
        return f'{self.profesional} - {self.dia} - {self.horainicio} - {self.horafin}' 

    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'Diahoras'
        verbose_name_plural = 'Diahoras'

class Pacientes(models.Model):
    apellido = models.CharField(max_length=50, verbose_name="apellido")
    nombre = models.CharField(max_length=50, verbose_name="nombre")
    telefono1 = models.CharField(max_length=50, verbose_name="telefono1")
    telefono2 = models.CharField(max_length=50, verbose_name="telefono2")
    email = models.CharField(max_length=50, verbose_name="email")
    fnacimiento = models.DateField(verbose_name="fnacimiento")
    osocial = models.ForeignKey(Obrasociales, on_delete=models.CASCADE, verbose_name="osocial") 
    plan = models.CharField(max_length=50, verbose_name="plan")
    nrosocial = models.CharField(max_length=25, verbose_name="nrosocial")
    domicilio = models.CharField(max_length=150, verbose_name="domicilio")
    observa = models.CharField(max_length=300, verbose_name="observa")
    obsclinica = models.CharField(max_length=500, verbose_name="obsclinica")
    dni = models.IntegerField(verbose_name="dni")
    celular = models.CharField(max_length=15, verbose_name="celular")
    
    def __str__(self):
        return f'{self.nombre} {self.apellido}' 

    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'Pacientes'
        verbose_name_plural = 'Pacientes'

class Turnos(models.Model):
    anio = models.IntegerField(verbose_name="anio") 
    mes = models.IntegerField(verbose_name="mes") 
    dia = models.DateField(verbose_name="dia")
    tratamiento = models.ForeignKey(Tratamientos, on_delete=models.CASCADE, verbose_name="tratamiento", default=0) 
    profesional = models.ForeignKey(Profesionales, on_delete=models.CASCADE, verbose_name="profesional", default=0) 
    estado = models.CharField(max_length=9, verbose_name="estado") 
    hora = models.TimeField(verbose_name="hora",null=True)
    paciente = models.ForeignKey(Pacientes, on_delete=models.CASCADE, verbose_name="pacientes", default=0) 
    llegada = models.TimeField(verbose_name="llegada",null=True)
    atencion = models.CharField(max_length=10, verbose_name="atencion",null=True) 
    tipo = models.CharField(max_length=9, verbose_name="tipo") 

    def __str__(self):
        return f'{self.dia} - {self.hora} - {self.profesional} - {self.paciente}  ' 

    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'Turnos'
        verbose_name_plural = 'Turnos'

class HistoriasClinicas(models.Model):
    dia = models.DateField(verbose_name="dia")
    paciente = models.ForeignKey(Pacientes, on_delete=models.CASCADE, verbose_name="paciente")
    diagnostico = models.CharField(max_length=8, verbose_name="diagnostico") 
    especialidad = models.ForeignKey(Especialidades, on_delete=models.CASCADE, verbose_name="especialidad")
    profesional = models.ForeignKey(Profesionales, on_delete=models.CASCADE, verbose_name="profesional") 
    observacion = models.CharField(max_length=4000, verbose_name="observacion")

    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'HistoriasClinicas'
        verbose_name_plural = 'HistoriasClinicas'