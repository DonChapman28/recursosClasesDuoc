my_list = []
print(my_list)
print(type(my_list))
my_list.append("hola")
print(my_list)
numero = int(input("ingrese un numero a la lista: "))
my_list.append(numero)
print(my_list)
print(len(my_list))
my_list.append(len(my_list))
print(my_list)

print(my_list[1])
print(my_list[0])

my_list[1] = 0

print(my_list)

mi_lista = my_list.copy()

my_list.reverse()
print(my_list)
print(mi_lista)

my_list.pop(1)
mi_lista[1] = "copion"

print(my_list)
print(mi_lista)

nueva_lista = mi_lista.pop(1)

print(nueva_lista)

