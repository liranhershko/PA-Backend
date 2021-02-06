from django.http import HttpResponse, JsonResponse
from django.template import loader
from .models import Assignment
from rest_framework.decorators import api_view


@api_view(['GET'])
def index(request):
    assignment_list = list(Assignment.objects.all().values())
    data = {
        'assignment_list': assignment_list,
    }
    return JsonResponse(data)

@api_view(['GET'])
def detail(request, assignment_id):
    return HttpResponse("You're looking at assignment with id %s." % assignment_id)
