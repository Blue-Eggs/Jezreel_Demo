
from django.urls import path
from . import views

urlpatterns = [
    path('views2/', views.testPOST),
    path('views/', views.getTrackInfo),
    path('hello/', views.getName)
]