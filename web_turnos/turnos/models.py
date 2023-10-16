from django.db import models

# Create your models here.

class especialidades(models.Model):
    descripcion = models.CharField(max_length=50, verbose_name="descripcion")
    estado = models.CharField(max_length=8, verbose_name="estado") 
    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'especialidades'

class feriados(models.Model):
    dia = models.DateField()
    descripcion = models.CharField(max_length=50, verbose_name="descripcion")
    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'feriados'

class obrasociales(models.Model):
    descripcion = models.CharField(max_length=50, verbose_name="descripcion")
    estado = models.CharField(max_length=8, verbose_name="estado") 
    
    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'obrasociales'

class tratamientos(models.Model):
    descripcion = models.CharField(max_length=50, verbose_name="descripcion")
    estado = models.CharField(max_length=8, verbose_name="estado") 
    
    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'tratamientos'

class profesionales(models.Model):
    apellido = models.CharField(max_length=50, verbose_name="apellido")
    nombre = models.CharField(max_length=50, verbose_name="nombre")
    telefono1 = models.CharField(max_length=50, verbose_name="telefono1")
    telefono2 = models.CharField(max_length=50, verbose_name="telefono2")
    email = models.CharField(max_length=50, verbose_name="email")
    especialidad = models.ForeignKey(especialidades, on_delete=models.CASCADE, verbose_name="especialidad") 
    intervalos = models.TimeField(verbose_name="intervalos")
    sobreturno = models.IntegerField(verbose_name="sobreturno") 
    sobreturnoe = models.IntegerField(verbose_name="sobreturnoe")
    estado = models.CharField(max_length=8, verbose_name="estado") 
    
    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'profesionales'

class diainactivos(models.Model):
    diadesde = models.DateField()
    descripcion = models.CharField(max_length=50, verbose_name="descripcion")
    profesional = models.ForeignKey(profesionales, on_delete=models.CASCADE, verbose_name="profesional") 
    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'diainactivos'

class tdiahoras(models.Model):
    profesional = models.ForeignKey(profesionales, on_delete=models.CASCADE, verbose_name="profesional") 
    dia = models.IntegerField(verbose_name="dia") 
    horainicio = models.TimeField(verbose_name="horainicio")
    horafin = models.TimeField(verbose_name="horafin")
    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'tdiahoras'

class pacientes(models.Model):
    apellido = models.CharField(max_length=50, verbose_name="apellido")
    nombre = models.CharField(max_length=50, verbose_name="nombre")
    telefono1 = models.CharField(max_length=50, verbose_name="telefono1")
    telefono2 = models.CharField(max_length=50, verbose_name="telefono2")
    email = models.CharField(max_length=50, verbose_name="email")
    fnacimiento = models.DateField(verbose_name="fnacimiento")
    osocial = models.ForeignKey(obrasociales, on_delete=models.CASCADE, verbose_name="osocial") 
    plan = models.CharField(max_length=50, verbose_name="plan")
    nrosocial = models.CharField(max_length=25, verbose_name="nrosocial")
    domicilio = models.CharField(max_length=150, verbose_name="domicilio")
    observa = models.CharField(max_length=300, verbose_name="observa")
    obsclinica = models.CharField(max_length=500, verbose_name="obsclinica")
    dni = models.IntegerField(verbose_name="dni")
    celular = models.CharField(max_length=15, verbose_name="celular")
    
    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'pacientes'

class turnos(models.Model):
    anio = models.IntegerField(verbose_name="anio") 
    mes = models.IntegerField(verbose_name="mes") 
    dia = models.DateField(verbose_name="dia")
    tratamiento = models.ForeignKey(tratamientos, on_delete=models.CASCADE, verbose_name="tratamiento")
    profesional = models.ForeignKey(profesionales, on_delete=models.CASCADE, verbose_name="profesional") 
    estado = models.CharField(max_length=8, verbose_name="estado") 
    hora = models.TimeField(verbose_name="hora")
    paciente = models.ForeignKey(pacientes, on_delete=models.CASCADE, verbose_name="paciente")
    llegada = models.TimeField(verbose_name="llegada")
    atencion = models.CharField(max_length=10, verbose_name="atencion") 
    tipo = models.CharField(max_length=9, verbose_name="tipo") 

    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'turnos'

class historiaclinicas(models.Model):
    dia = models.DateField(verbose_name="dia")
    paciente = models.ForeignKey(pacientes, on_delete=models.CASCADE, verbose_name="paciente")
    diagnostico = models.CharField(max_length=8, verbose_name="diagnostico") 
    especialidad = models.ForeignKey(especialidades, on_delete=models.CASCADE, verbose_name="especialidad")
    profesional = models.ForeignKey(profesionales, on_delete=models.CASCADE, verbose_name="profesional") 
    observacion = models.CharField(max_length=4000, verbose_name="observacion")

    class Meta:
        # Especifica el nombre de la tabla personalizado
        db_table = 'historiaclinicas'