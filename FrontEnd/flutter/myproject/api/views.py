from django.http import HttpResponse

def getData(request):
    return HttpResponse("Heyo, Dylan here... please go to 127.0.0.1:8000/accounts/login to test this out")