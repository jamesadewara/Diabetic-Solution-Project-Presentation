from django.shortcuts import render
from rest_framework import generics
from rest_framework.permissions import AllowAny
from django.shortcuts import get_object_or_404
import json
from django.conf import settings
from django.http import JsonResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .utility import DiabeticAiPredictor


class PredictedResultView(APIView):
    def post(self, request):
        try:
            # Retrieve necessary parameters from request data
            pregnancies = float(request.data.get("Pregnancies", "0"))
            glucose = float(request.data.get("Glucose", "0"))
            blood_pressure = float(request.data.get("BloodPressure", "0"))
            skin_thickness = float(request.data.get("SkinThickness", "0"))
            insulin = float(request.data.get("Insulin", "0"))
            bmi = float(request.data.get("BMI", "0"))
            diabetes_pedigree_function = float(request.data.get("DiabetesPedigreeFunction", "0"))
            age = float(request.data.get("Age", "0"))

            dab_model = DiabeticAiPredictor(csv_file="/home/adewara/Documents/Workspace/Presentations/DIABETES/DiabeticServer/MainApp/assets/germany.csv")
            dab_model.initDataset()
            load_dab_model = dab_model.load(name="/home/adewara/Documents/Workspace/Presentations/DIABETES/DiabeticServer/MainApp/assets/diabetic_model.pkl")
            predicted_result = dab_model.makePredictions(load_dab_model, Pregnancies=pregnancies, Glucose=glucose, BloodPressure=blood_pressure, SkinThickness=skin_thickness, Insulin=insulin, BMI=bmi, DiabetesPedigreeFunction=diabetes_pedigree_function, Age=age )

            score = dab_model.preview(load_dab_model)
            print(score, predicted_result)
            return JsonResponse(
                {
                    'error': False,
                    'data':
                        {
                            "accuracy": str(score[1]),
                            "precision": str(score[0]),
                            "result": str(predicted_result[0])
                        } 
                }, 
            status=status.HTTP_200_OK
        )
        
        except Exception as e:
            print(e)
            # Handle any exceptions and return error response
            return Response(
                {'error': True, 'data':{}},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )
