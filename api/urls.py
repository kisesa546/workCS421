from django.urls import path
from .views import SubjectListView,StudentsListView

urlpatterns= [
path('students/',StudentsListView.as_view()),
path('subject/',SubjectListView.as_view())
]
