//
//  Exe9.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 27/03/22.
//

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
                        Lettera_Maiuscola = false
                        Carattere_Speciale = false
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
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5).padding(.horizontal)).disabled(Dis3)
                    .toolbar {
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
