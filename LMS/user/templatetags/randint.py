from django import template
from random import random
register=template.Library()

@register.simple_tag(name="randint")
def randint(n):
    n=10
    return str(random.randint(1,6))