//
//  Exe3.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

import SwiftUI

struct Exe3: View {
    @State var Anno: Int = 0
    var body: some View {
        ScrollView {
            
           VStack{
               Text("Prova codice").font(.title.bold()).padding(.bottom)
               Text("Controlla se l'anno è bisestile").padding(.bottom).font(.caption.bold())
            
               Text("Inserisci l'anno:")
                HStack{
                    Image(systemName: "globe.europe.africa.fill").padding(30)
                    TextField("Anno",  value: $Anno, format: .number).keyboardType(.numberPad)
                }.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
               
                switch (Bisestile(anno: Anno)) {
                    case true:
                        HStack{Image(systemName: "globe").padding();Text("Anno Bisestile").background(Color.green).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding()
                    case false:
                        HStack{Image(systemName: "globe").padding();Text("Anno non Bisestile").background(Color.red).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding()
                }
                Text("Nota: inserito i numeri il risultato si modificherà da solo!!!").font(.system(size: 13.0)).padding()
            }
        }.padding() .onTapGesture {hideKeyboard()}
    }
}

struct Exe3_Previews: PreviewProvider {
    static var previews: some View {
        Exe3()
    }
}
