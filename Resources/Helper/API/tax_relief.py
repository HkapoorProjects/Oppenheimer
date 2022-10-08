# This python file consist function which calculate the tax_relief
# Tax Relief = ((salary - tax paid ) * variable ) + gender bonus
import math


def tax_relief_calculation(salary, tax_paid, age):
    if age <= 18:
        variable = 1.00
    elif age <= 35:
        variable = 0.80
    elif age <= 50:
        variable = 0.50
    elif age <= 75:
        variable = 0.367
    else:
        variable = 0.05
    tax_relief = (salary - tax_paid) * variable
    return tax_relief


def tax_relief_with_gender_bonus(tax_relief, gender):
    if gender == 'M':
        total_tax_relief = tax_relief + 0
    else:
        total_tax_relief = tax_relief + 500
    return total_tax_relief


def get_final_tax_relief(salary, tax_paid, age, gender):
    tax_relief = tax_relief_calculation(salary, tax_paid, age)
    total_tax_relief = tax_relief_with_gender_bonus(tax_relief, gender)
    if total_tax_relief <= 50:
        return f"{50:.2f}"
    else:
        return f"{total_tax_relief:.2f}"
