//
//  Classe Generatore.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 24/03/22.
//

import Foundation

public class PasswordGenerator {
    public var Caratteri = "锕!#$%&'()*+,-./:;<=>[]^_{|}~ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    private static var g = Int.random(in: 0...1)
    public var Alfabeto: String = "0123456789"
    var LunghezzaMinina: Int = 3
    init(Alfabeto: String, LunghezzaMinima: Int = 3){
        if self.Alfabeto.count == 0{
            print("Inserisci almeno un carattere")
        }else {
            self.Alfabeto = Alfabeto
        }
        if self.LunghezzaMinina < 3{
            print("Lunghezza Minima: 3")
        } else {
            self.LunghezzaMinina = LunghezzaMinima
        }
    }
    public func PasswordGenerator(TipoPassword: TipoPassword = TipoPassword.Lettere){
        SetTipoPassword(tipoPassword: TipoPassword)
    }
   public func SetTipoPassword(tipoPassword: TipoPassword = TipoPassword.Lettere){
        if tipoPassword == TipoPassword.Cifre{
            Alfabeto = Caratteri.substring(from: Caratteri.firstIndex(of: "0")!)
        } else if tipoPassword == TipoPassword.Lettere{
            Alfabeto = Caratteri.substring(from: Caratteri.firstIndex(of: "A")!)
        } else if tipoPassword == TipoPassword.Personale{
            Alfabeto = ""
        } else if tipoPassword == TipoPassword.File{
            Alfabeto = "Scegli il file qua sopra"
        } else {
            Alfabeto = Caratteri
        }
    }
   public func NuovaPassword(lunghezza: inout Int) -> String {
       if Alfabeto.count == 0{
           return "Inserisci almeno un carattere!!!"
       }
        if lunghezza == 0 {
            lunghezza = LunghezzaMinina
            return "Inserisci almeno un carattere"
        }
        if lunghezza < LunghezzaMinina {
            print("Password troppo corta. Almeno \(LunghezzaMinina) caratteri.")
        }
        var psw: String = ""
        var i = 0
        repeat {
            Impara_Swift.PasswordGenerator.g = Int.random(in: 0...Alfabeto.count - 1)
            let s = Alfabeto[String.Index(encodedOffset: Impara_Swift.PasswordGenerator.g)]
            psw += "\(s)"
            i += 1
        } while i < lunghezza
        return psw
    }
    public func AlmenoUnaLetteraMaiuscola(str: String)->Bool{
        var bool = false
        for char in str {
                if char.isUppercase {
                    bool = true
            }
        }
        return bool
    }
    public func AlmenoUnCarattereSpeciale(str: String) -> Bool{
        let cc: String = Caratteri.substring(to: Caratteri.firstIndex(of: "~")!)
        var bool = false
        for char in str {
            if cc.contains("\(char)") {
                    bool = true
            }
        }
        return bool
    }
    public enum TipoPassword{
        case Cifre, Lettere, CaratteriSpeciali, Personale, File
    }
    
}

