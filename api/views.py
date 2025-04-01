from django.shortcuts import render
from rest_framework import generics
from .models import Student,Subject
from .serializer import StudentSerializer,SubjectSerializer
# Create your views here.

class StudentsListView(generics.ListAPIView):
    queryset=Student.objects.all()
    serializer_class=StudentSerializer

class SubjectListView(generics.ListAPIView):
    queryset=Subject.objects.all()
    serializer_class=SubjectSerializer