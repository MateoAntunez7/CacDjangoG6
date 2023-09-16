from django.shortcuts import render, HttpResponse

# Create your views here.
def index(request):
    return render(request, 'index.html', {})

def contacto(request):
    return render(request, 'contactanos.html', {})

def nosotros(request):
    return render(request, 'nosotros.html', {})

def tratamientos(request):
    return render(request, 'tratamientos.html', {})

def experiencias(request):
    return render(request, 'experiencias.html', {})


