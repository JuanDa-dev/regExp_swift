/*
Filtrar textos que contengan el error de n seguida de b o n seguida de p y 
reemplazar por m en ambos casos.
    "enbargo",
    "ampliar",
    "sienpre",
    "enjambre",
    "enpanada"
*/
import Foundation

func corregirErrores(_ texto: String) -> String {
    let patterns = ["n(b|p)", "otroPatron", "tercerPatron"]
    var correctedText = texto
    for pattern in patterns {
        correctedText = correctedText.replacingOccurrences(of: pattern, with: "m$1", options: .regularExpression)
    }
    return correctedText
}

let argumentos = CommandLine.arguments
let ejemplos = Array(argumentos.dropFirst())

for ejemplo in ejemplos {
    let textoCorregido = corregirErrores(ejemplo)
    if textoCorregido == ejemplo {
        print("Palabra bien escrita: \(ejemplo)")
    } else {
        print("Texto original: \(ejemplo)")
        print("Texto corregido: \(textoCorregido)\n")
    }
}