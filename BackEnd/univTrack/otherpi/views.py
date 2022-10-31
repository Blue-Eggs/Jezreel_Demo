from django.shortcuts import HttpResponse
from django.http import JsonResponse
from django.shortcuts import render
from . import trackInfo
from .models import userTrack
import json

from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from rest_framework.decorators import api_view, permission_classes

from django.views.decorators.csrf import csrf_exempt

def getName(request):
    all_info = userTrack.objects.all
    #print(all_info)
    return HttpResponse(all_info, request)

   # return JsonResponse(all_info, safe = False)

@csrf_exempt
@permission_classes([AllowAny],)
def testPOST(request):
    print('IM HERE')
    if request.method == 'POST':
        #data = request.body
        #title = request.POST.get('title')
        #JSONDecoder(data)
        data = json.loads(request.body)
        print(data['title'])
    result = trackInfo.getInfoTrack(data['title'])
    return JsonResponse(result, safe=False)

@api_view(['GET'],)
@permission_classes([AllowAny],)
def getTrackInfo(request):
    result = trackInfo.getInfoTrack('SHIPPO_TRANSIT')
    return JsonResponse(result, safe=False)
