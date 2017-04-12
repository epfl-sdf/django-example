from django.shortcuts import render
from django.contrib.auth.decorators import login_required


def index(request):
    context = {'text': 'Hello world !'}
    return render(request, 'hello_world/base_template.html', context)


@login_required
def logged(request):
    context = {'text': 'Logged !'}
    return render(request, 'hello_world/base_template.html', context)
