Tipos de Datos en TypeScript:

En TypeScript, los tipos de datos permiten definir qué tipo de valores pueden tener las variables. Algunos tipos de datos comunes son:

    number: Números, ya sean enteros o decimales.
    string: Cadenas de texto.
    boolean: Valores verdaderos o falsos.
    array: Arreglos que pueden contener varios valores del mismo tipo.
    object: Objetos que pueden contener propiedades con diferentes tipos de valores.
    any: Representa cualquier tipo de dato (menos recomendado, ya que evita 
	 la verificación de tipos estática de TypeScript).

-------------------------------------------------------------------------------------------------------------------------------------------
Input y Print en TypeScript:

Para obtener entrada del usuario, puedes usar la función prompt en el navegador o utilizar 
librerías específicas en entornos de servidor. Para imprimir en la consola, puedes usar console.log.

Ejemplo de entrada y salida en consola:
const input = prompt("Ingresa un número:"); // Obtiene entrada del usuario
const num = parseInt(input); // Convierte la entrada a un número entero

console.log("El número ingresado es:", num); // Imprime en la consola

-------------------------------------------------------------------------------------------------------------------------------------------
Lógica de Control - if, else if y else:

Las declaraciones if, else if y else te permiten tomar decisiones en tu código basado en condiciones.

const age = 20;

if (age < 18) {
    console.log("Eres menor de edad.");
} else if (age >= 18 && age < 65) {
    console.log("Eres adulto.");
} else {
    console.log("Eres un adulto mayor.");
}
-------------------------------------------------------------------------------------------------------------------------------------------
Bucle for:

El bucle for se utiliza para ejecutar un bloque de código varias veces, controlando la iteración mediante una variable contador.

for (let i = 0; i < 5; i++) {
    console.log("Iteración:", i);
}

-------------------------------------------------------------------------------------------------------------------------------------------
Bucle while y do while:

El bucle while se ejecuta mientras una condición sea verdadera. El bucle do while es similar, pero garantiza 
que el bloque de código se ejecute al menos una vez antes de verificar la condición.

let count = 0;

while (count < 5) {
    console.log("Contador:", count);
    count++;
}

let num = 10;
do {
    console.log("Número:", num);
    num--;
} while (num > 0);
