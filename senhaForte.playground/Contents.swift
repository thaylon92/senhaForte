import UIKit
import Foundation


func checkPassword(_ password: String) -> Bool {
    // vrifica se possui pelo menos uma letra maisucla
    
    var capitalLetter  = CharacterSet()
    capitalLetter.insert(charactersIn: "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,Y,X,Z")
    let texttest = password.rangeOfCharacter(from: capitalLetter) != nil
    guard texttest == true  else { return false }
    
    // verifica se inicia com uma letra maiuscula
    
    guard let firstLetter = password.first else {return false}
    if firstLetter.isUppercase == true {
    } else {
        return false
    }
    
    // verifica se possui pelo menos uma letra minuscula
    
    var lowerLetter  = CharacterSet()
    lowerLetter.insert(charactersIn: "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,y,x,z")
    let texttest0 = password.rangeOfCharacter(from: lowerLetter) != nil
    guard texttest0 == true else { return false }
    
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
    
    if indices.count >= 3 {
        var anterior = -1
        var isNotIqual = true
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
                anterior = x
            }
        }
        
        if !verifica.contains(false)  {
            return false
        }
        
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



