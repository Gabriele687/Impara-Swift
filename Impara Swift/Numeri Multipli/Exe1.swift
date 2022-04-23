//
//  Exe1.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

import SwiftUI

struct Exe1: View {
    @State private var num1 = 0
    @State private var num2 = 0
    @State private var risultato = "Ris"
    
    var body: some View {
        ScrollView {
            VStack{
            Text("Prova Codice").font(.title.bold()).padding(.bottom)
            
            Text("Inserisci il numero più Grande:")
                HStack{
                    Image(systemName: "plus.circle").padding(30)
            TextField("Num1",  value: $num1, format: .number).keyboardType(.numberPad)
                }.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
            
            Text("Inserisci il numero più Piccolo:")
                HStack{
                    Image(systemName: "minus.circle").padding(30)
            TextField("Num2",  value: $num2, format: .number).keyboardType(.numberPad)
                }.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                   
            
                if num1.isMultiple(of: num2) {
                   
                    Text("Risultato:").padding()
                    HStack{Image(systemName: "equal.circle"); Text("I numeri sono multipli").background(Color.red).cornerRadius(6).padding().font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding()}
                else{
                    Text("Risultato:").padding()
                    HStack{Image(systemName: "equal.circle");Text("I numeri non sono multipli").background(Color.green).cornerRadius(6).padding().font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding()
                    
                }
            
                Text("Nota: inserito i numeri il risultato si modificherà da solo!!!").font(.system(size: 13.0)).padding()
            }
        }.padding() .onTapGesture {hideKeyboard()}
    }
}

struct Exe1_Previews: PreviewProvider {
    static var previews: some View {
        Exe1()
    }
}
