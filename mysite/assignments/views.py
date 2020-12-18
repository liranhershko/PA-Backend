from django.http import HttpResponse
from django.template import loader
from .models import Assignment


def index(request):
    assignment_list = Assignment.objects.all()
    template = loader.get_template('assignments/index.html')
    context = {
        'assignment_list': assignment_list,
    }
    return HttpResponse(template.render(context, request))


def detail(request, assignment_id):
    return HttpResponse("You're looking at assignment %s." % assignment_id)
