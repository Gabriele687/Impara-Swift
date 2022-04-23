//
//  Exe8.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 16/03/22.
//

import SwiftUI

struct Exe8: View {
    @State var Testo: Int = 0
    @State var Risultato: String = "Risultato"
    @State var Indizi = "Indizi"
    @State var Generate = Int.random(in: 0..<20)
    @State var Volte = 0
    @State var fr: Double = 20
    var body: some View {
        let SliderImpact = UIImpactFeedbackGenerator(style: .light)
        VStack {
            Text("Indovina il numero da 0 a \(fr.Togli0())").bold()
            HStack {
                if Testo == Generate {
                    VStack {
                        HStack {
                            Image(systemName: "text.alignleft")
                            Text("Giusto!!!")}.textFieldStyle(.roundedBorder)
                    Button("Ricomincia"){
                        Testo = 0
                        Indizi = "0"
                        Volte = 0
                        Generate = Int.random(in: 0..<Int(fr))
                    }.buttonStyle(.bordered)
                    }
                } else {
                    HStack {
                    Image(systemName: "text.alignleft")
                    TextField("Inserisci il Numero", value: $Testo, format: .number)}.textFieldStyle(.roundedBorder)
                }
            }.frame(alignment: .center).padding()
            Text("Difficoltà").padding(.top)
            Slider(value: $fr, in: 10...50, step: 1).padding(.horizontal).onChange(of: fr) { value in
                Generate = Int.random(in: 0..<Int(fr))
                Volte = 0
                SliderImpact.prepare()
                SliderImpact.impactOccurred()
            }
            
            VStack{
                VStack {
                    
                Button("Premi per indizio"){
                    Verifica()
                    Volte += 1
                }.buttonStyle(.bordered)
                    HStack {
                        Image(systemName: "wand.and.stars")
                        Text("\(Indizi)")
                    }
            }.padding()
                HStack{
                    Image(systemName: "wand.and.stars")
                    Text("Hai usato l'indizio volte: \(Volte)")
                }
            }.padding()
        }
    }
        func Verifica(){
        if Testo < Generate {
            Indizi = "Il numero è più grande"
        } else if Testo > Generate {
            Indizi = "Il numero è più piccolo"
        }
    }
}

struct Exe8_Previews: PreviewProvider {
    static var previews: some View {
        Exe8()
    }
}
