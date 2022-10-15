
from django.urls import path
from . import views

urlpatterns = [
    path('views/', views.getTrackInfo),
    path('hello/', views.getName)
]