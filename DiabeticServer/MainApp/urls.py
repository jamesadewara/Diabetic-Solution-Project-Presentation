from django.urls import path
from .views import (
PredictedResultView
)

urlpatterns = [
    path('predict', PredictedResultView.as_view(), name='result'),
]