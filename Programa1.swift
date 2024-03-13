/*
Identificar si un número hexadecimal de 3 o 6 caracteres (formato #fff o #ffffff) 
exclusivamente (no es un rango y no puede superar ni ser inferior a estos dos 
números), es un código de color válido. Ejemplo: #4ab, es válido; #acf3ae, es 
válido; #4512abc, es inválido; #a235, es inválido; #u38, es inválido.
*/

import Foundation

func esCodigoColorValido(codigo: String) -> Bool {
    // Comprueba si el código comienza con '#'
    let comienzaConGato = try! NSRegularExpression(pattern: "^#", options: [])
    let esComienzaConGato = !comienzaConGato.matches(in: codigo, options: [], range: NSRange(location: 0, length: 1)).isEmpty
    
    // Comprueba si el código tiene 3 caracteres (sin contar el '#')
    let longitudTres = try! NSRegularExpression(pattern: "^#.{3}$", options: [])
    let esLongitudTres = !longitudTres.matches(in: codigo, options: [], range: NSRange(location: 0, length: codigo.utf16.count)).isEmpty
    
    // Comprueba si el código tiene 6 caracteres (sin contar el '#')
    let longitudSeis = try! NSRegularExpression(pattern: "^#.{6}$", options: [])
    let esLongitudSeis = !longitudSeis.matches(in: codigo, options: [], range: NSRange(location: 0, length: codigo.utf16.count)).isEmpty
    
    // Comprueba si todos los caracteres son dígitos o letras hexadecimales
    let digitosOletras = try! NSRegularExpression(pattern: "^[0-9a-fA-F]*$", options: [])
    let rango = NSRange(location: 1, length: codigo.utf16.count - 1) // Ignora el primer caracter ('#')
    let esDigitosOletras = !digitosOletras.matches(in: codigo, options: [], range: rango).isEmpty
    
    return esComienzaConGato && (esLongitudTres || esLongitudSeis) && esDigitosOletras
}

let argumentos = CommandLine.arguments
//argumentos de prueba 

for i in 1..<argumentos.count {
    let codigo = argumentos[i]
    if esCodigoColorValido(codigo: codigo) {
        print("\(codigo) es válido")
    } else {
        print("\(codigo) no es válido")
    }
}