//
//  Es9.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 24/03/22.
//


import SwiftUI

struct Es9: View {
    @State private var descrizioneFile = #"""
 
 import SwiftUI

 struct Exe9: View {
     @State var Tipo_Alfabeto = ["Numeri", "Alfanumerico", "Lettere Speciali", "Personalizzato"]
     @State private var Tipo_Scelto = "Numeri"
     @State var Lunghezza = 10.0
     @State private var Lettera_Maiuscola = false
     @State private var Carattere_Speciale = false
     @State private var Nuova_Password = ""
     @State private var Tipo_Password = PasswordGenerator.TipoPassword.CaratteriSpeciali
     @State private var Password_Generator = PasswordGenerator.init(Alfabeto: "0123456789", LunghezzaMinima: 3)
     @State var Alfabeto = "0123456789"
     @State var Dis1 = true
     @State var Dis2 = true
     @State var Dis3 = true
     private var UpperCase_Char = CharacterSet(["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"])
     private var Special_Char = CharacterSet(["锕","!","#","$","%","&","'","(","*","+","-",".","/",":",";","<","=",">","[","^","_","{","|","}","~"])
     @FocusState var isInputActive: Bool
     @State private var Copy_Alert = false
     var body: some View {
         let SliderImpact = UIImpactFeedbackGenerator(style: .light)
         let PickerImpact = UIImpactFeedbackGenerator(style: .soft)
         ScrollView{
             VStack {
                 Text("Prova Codice").font(.title.bold()).padding()
                 Text("Tipo Alfabeto: \(Tipo_Scelto)")
                 Picker("Scegli tipo Alfabeto", selection: $Tipo_Scelto) {
                                 ForEach(Tipo_Alfabeto, id: \.self) {
                                     Text($0)
                                 }
                 }.pickerStyle(.segmented).onChange(of: Tipo_Scelto.count, perform: { (value) in
                     PickerImpact.prepare()
                     PickerImpact.impactOccurred()
                     if Tipo_Scelto == "Numeri"{
                         Password_Generator.SetTipoPassword(tipoPassword: .Cifre)
                         Dis1 = true
                         Dis2 = true
                         Dis3 = true
                     }
                     if Tipo_Scelto == "Alfanumerico"{
                         Password_Generator.SetTipoPassword(tipoPassword: .Lettere)
                         Dis1 = false
                         Dis2 = true
                         Dis3 = true
                     }
                     if Tipo_Scelto == "Lettere Speciali"{
                         Password_Generator.SetTipoPassword(tipoPassword: .CaratteriSpeciali)
                         Dis1 = false
                         Dis2 = false
                         Dis3 = true
                     }
                     if Tipo_Scelto == "Personalizzato"{
                         Password_Generator.SetTipoPassword(tipoPassword: .Personale)
                         Dis1 = false
                         Dis2 = true
                         Dis3 = false
                     }
                     Alfabeto = Password_Generator.Alfabeto
                 })
                 Text("Alfabeto:").bold().padding(.top)
                 TextEditor(text: $Alfabeto)
                     .onChange(of: Alfabeto) { newValue in
                         if Alfabeto.rangeOfCharacter(from: UpperCase_Char) == nil{
                             Dis1 = true
                         } else {
                             Dis1 = false
                         }
                         if Alfabeto.rangeOfCharacter(from: Special_Char) == nil{
                             Dis2 = true
                         } else {
                             Dis2 = false
                         }
                     }
                     .padding(.horizontal).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5).padding(.horizontal)).disabled(Dis3).toolbar {
                         ToolbarItemGroup(placement: .keyboard) {Spacer(); Button("Done") {
                         isInputActive = false
                         hideKeyboard()
                     }
                     }
                 }
                 Text("Lunghezza Password: \(Lunghezza.Togli0())").padding(.top)
                 Slider(value: $Lunghezza, in: 3...20, step: 1).padding(.horizontal).onChange(of: Lunghezza ){newValue in
                     SliderImpact.prepare()
                     SliderImpact.impactOccurred()
                 }
                     
                     
                 
                 Toggle("Almeno una lettera Maiuscola", isOn: $Lettera_Maiuscola).disabled(Dis1)
                 Toggle("Almeno un carattere Speciale", isOn: $Carattere_Speciale).disabled(Dis2)
                 Button("Genera Password") {
                     Genera_Password()
                 }.buttonStyle(.borderedProminent).padding()
             }.padding([.top, .leading, .trailing])
             
             Button("Copia Password") {Copia(); Copy_Alert = true}.buttonStyle(.bordered).frame(width: 200, height: 2, alignment: .center).font(.system(size: 12)).padding(.bottom).alert("Copiato!!!", isPresented: $Copy_Alert) {
                 Button("OK", role: .cancel) {}
             }
             Text("\(Nuova_Password)").textSelection(.enabled).padding(.top)
         }
     }
     func Genera_Password(){
         if Tipo_Scelto == "Personalizzato" {
             Password_Generator.Alfabeto = Alfabeto
             if Alfabeto.rangeOfCharacter(from: Special_Char) == nil{
                 var l = Int(Lunghezza)
                 let psw = Password_Generator.NuovaPassword(lunghezza: &l)
                 Nuova_Password = psw
                 return
             }
             if Alfabeto.rangeOfCharacter(from: UpperCase_Char) == nil{
                 var l = Int(Lunghezza)
                 let psw = Password_Generator.NuovaPassword(lunghezza: &l)
                 Nuova_Password = psw
                 return
             }
         }
         var l = Int(Lunghezza)
         var psw = Password_Generator.NuovaPassword(lunghezza: &l)
         if Lettera_Maiuscola {
             while !Password_Generator.AlmenoUnaLetteraMaiuscola(str: psw){
                 psw = Password_Generator.NuovaPassword(lunghezza: &l)
             }
         }
         if Carattere_Speciale {
             while !Password_Generator.AlmenoUnCarattereSpeciale(str: psw){
                 psw = Password_Generator.NuovaPassword(lunghezza: &l)
             }
         }
         Nuova_Password = psw
     }
     private func Copia(){
         let pasteboard = UIPasteboard.general
         pasteboard.string = Nuova_Password
     }
 }

 struct Exe9_Previews: PreviewProvider {
     static var previews: some View {
         Exe9()
     }
 }



 """#
    @State private var descrizioneClasse = #"""
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

"""#
    var body: some View {
        ScrollView {
        VStack(){
            Text("Codice Main file:")
                .padding(.horizontal)
                .padding(.top)
                .font(.system(size: 15).bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView{
                Text(descrizioneFile)
                            .contextMenu {Button(action: {UIPasteboard.general.string = descrizioneFile}) {Text("Copia")}}
                .font(.system(size: 11.0))
            }
            .padding(.horizontal)
            .frame(height: 350, alignment: .top)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding(.horizontal,10)
            Text("Codice Classe:")
                .padding(.horizontal)
                .padding(.top)
                .font(.system(size: 15).bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView{
                Text(descrizioneClasse)
                            .contextMenu {Button(action: {UIPasteboard.general.string = descrizioneFile}) {Text("Copia")}}
                .font(.system(size: 11.0))
            }
            .padding(.horizontal)
            .frame(height: 350, alignment: .top)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding(.horizontal,10)
            Text("Descrizione:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top)
                .font(.system(size: 17).bold())
            Text("Generatore Password: questo esercizio è formato da una classe e un View file, vi permetterà di generare una password secondo anche i vostri criteri.").font(.caption).padding(.horizontal)
                Button(action: { }) {
                    NavigationLink(destination: Exe9().navigationTitle("Genera Password")){Text("Prova il codice")}
                }.buttonStyle(GradientButtonStyle()).padding(.top)
            }
        }
    }
}

struct Es_Previews: PreviewProvider {
    static var previews: some View {
        Es9()
    }
}
