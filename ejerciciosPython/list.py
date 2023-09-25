def sum_one(valor):
    return valor + 1

def sum_two(valor):
    return valor + 2

def sum_three(valor):
    return valor + 3

print(sum_one(2))
print(sum_two(2))
print(sum_three(2))

def sum_values_add_fun(first_value, second_value, f):
    return f (first_value + second_value)

print(sum_values_add_fun(2,2,sum_one))
print(sum_values_add_fun(2,2,sum_two))
print(sum_values_add_fun(2,2,sum_three))
