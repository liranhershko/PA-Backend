from django.urls import path

from . import views

urlpatterns = [
    # /assignments/
    path('', views.index, name='index'),
    path('<int:assignment_id>/', views.detail, name='detail'),
]
