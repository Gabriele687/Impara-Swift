//
//  Es1.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

import SwiftUI

struct Es1: View {
    @State private var button = true
    @State private var descrizione = """

import SwiftUI

struct Exe1: View {
    @State private var num1 = 0
    @State private var num2 = 0
    @State private var button = false
    @State private var risultato = "Ris"
    
    var body: some View {
        ScrollView {
            VStack{
            Text("Prova Codice").font(.title.bold()).padding(.bottom)
            
            Text("Inserisci il numero più Grande:")
                HStack{
                    Image(systemName: "plus.circle").padding(30)
            TextField("Num1",  value: $num1, format: .number)
                }
            
            Text("Inserisci il numero più Piccolo:")
                HStack{
                    Image(systemName: "minus.circle").padding(30)
            TextField("Num2",  value: $num2, format: .number)
                }
                   
            
                if num1.isMultiple(of: num2) {
                   
                    Text("Risultato:").padding()
                        HStack{
                            Image(systemName: "equal.circle")
                            Text("I numeri sono multipli")
                                        .background(Color.green)
                                        .cornerRadius(5)
                        }
                    }
                else{
                    Text("Risultato:").padding()
                        HStack{
                            Image(systemName: "equal.circle")
                            Text("I numeri non sono multipli")
                                        .background(Color.red)
                                        .cornerRadius(5)
                        }
                    
                }
            
                Text("Nota: inserito i numeri il risultato si modificherà da solo!!!").font(.system(size: 13.0)).padding()
        }.padding() .onTapGesture {
            hideKeyboard()
                        }
        }
    }
}
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
struct Exe1_Previews: PreviewProvider {
    static var previews: some View {
        Exe1()
    }
}

"""
    var body: some View {
        ScrollView{
        VStack(){
            Text("Codice:")
                .font(.system(size: 15).bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
           
            ScrollView{
                Text(descrizione)
                            .contextMenu {Button(action: {UIPasteboard.general.string = descrizione}) {Text("Copia")}}
                .font(.system(size: 11.0))
                    
            }.onTapGesture {
                hideKeyboard()
            }
            .padding(.horizontal)
            .frame(height: 350, alignment: .top)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding(.horizontal,10)

            
            Text("Descrizione:")
                .textSelection(.enabled)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .font(.system(size: 17).bold())
            Text("Esercizio Mulitpli; in questo esercizio troviamo come inserire informazioni da parte dell'utente, ridimensionare i vari oggetti, bottoni, cambio dei colori di sfondo e tanto altro; un esercizio di base ma che può aiutare molto. ").font(.caption).padding(.horizontal)
            
            Button(action: { }) {
                NavigationLink(destination: Exe1().navigationTitle("Multipli")){Text("Prova il codice")}
            }.buttonStyle(GradientButtonStyle()).padding(.top)
            }
        }
    }
}

struct Es1_Previews: PreviewProvider {
    static var previews: some View {
        Es1()
    }
}
