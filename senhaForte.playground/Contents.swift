import UIKit
import Foundation


func checkPassword(_ password: String) -> Bool {
    // vrifica se possui pelo menos uma letra maisucla
    
    let capitalLetterRegEx  = ".*[A-Z]+.*"
    let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
    guard texttest.evaluate(with: password)  else { return false }
    
    // verifica se inicia com uma letra maiuscula
    
    guard texttest.evaluate(with: password.prefix(1)) else { return false }
    
    // verifica se possui pelo menos uma letra minuscula
    
    let lowerLetterRegEx  = ".*[a-z]+.*"
    let texttest0 = NSPredicate(format:"SELF MATCHES %@", lowerLetterRegEx)
    guard texttest0.evaluate(with: password) else { return false }
    
    // verifica sem possui caracter especial
    
    let specialCharacterRegEx: CharacterSet  = [".","*","[","!","&","^","%","$","#","@","(",")","/","]","+",".","*"]
    let texttest2 = password.rangeOfCharacter(from: specialCharacterRegEx) != nil
    guard texttest2 == false  else { return false }
    
    
    // verifica se possui pelo menos um numero
    
    var numberSet = CharacterSet()
    numberSet.insert(charactersIn:"0123456789")
    let texttest1 = password.rangeOfCharacter(from: numberSet ) != nil
    guard texttest1 == true  else { return false }
    
    
    // verifica se tem numero em sequencia crescente
    let  numbers = Array(password)
    var indices: [Int] = []
    
    for valor in numbers {
        if let n = Int(String(valor))  {
            indices.append(n)
        } else if indices.count < 3 {
            indices.removeAll()
        }
    }
    
    var anterior = -1
    var isNotIqual = false
    var verifica: [Bool] = []
    
    for x in indices {
        if anterior == -1 {
            anterior = x
        } else {
            if x == anterior + 1 {
                isNotIqual = true
            } else {
                isNotIqual = false
            }
            if isNotIqual == true{
                verifica.append(true)
            } else {
                verifica.append(false)
            }
        }
    }
    
    if verifica != [true] {
        return false
    } else {
        
    }
    
    // verificar se tem de 5 a 15 caracter
    switch password.count {
    case 5...15:
        return true
    default:
        false
    }
    return false
}



let pass1 = "Teste123"
if checkPassword(pass1) {
    print("Senha forte")
} else {
    print("Não atende os requisitos!")
}



