from django.shortcuts import HttpResponse
from django.http import JsonResponse
from django.shortcuts import render
from . import trackInfo
from .models import userTrack

def getName(request):
    all_info = userTrack.objects.all
    #print(all_info)
    return HttpResponse(all_info, request)

   # return JsonResponse(all_info, safe = False)

def getTrackInfo(request):
    result = trackInfo.getInfoTrack('SHIPPO_TRANSIT')
    return JsonResponse(result, safe=False)
