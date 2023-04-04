import re
import random

def reg_exp(a):
    s=[]
    for i in a:
         r = re.sub(r"\$","",i)
         s.append(float(r))
    return s

def select_random_number():
    a=random.randint(1, 6)
    return a
