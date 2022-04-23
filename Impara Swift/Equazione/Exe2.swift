//
//  SwiftUIView.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

import SwiftUI

struct Exe2: View {
    @State private var a: Double = 0
    @State private var b: Double = 0
    @State private var c: Double = 0
    var body: some View {
        ScrollView {
            
           VStack{
               Text("Prova codice").font(.title.bold()).padding(.bottom)
               Text("Equazione di 2° Grado: ax\u{00B2}+bx+c").padding(.bottom).font(.caption.bold())
            Text("Inserisci il valore a dell'equzazione:")
                HStack{
                    Image(systemName: "a.circle").padding(30)
            TextField("a",  value: $a, format: .number).keyboardType(.numberPad)
                }.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
            
            Text("Inserisci il valore b dell'equazione:")
                HStack{
                    Image(systemName: "b.circle").padding(30)
            TextField("b",  value: $b, format: .number).keyboardType(.numberPad)
                }.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
            Text("Inserisci il valore c dell'equazione:")
                HStack{
                    Image(systemName: "c.circle").padding(30)
            TextField("c",  value: $c, format: .number).keyboardType(.numberPad)
                }.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                
                
                switch (F1(a: a, b: b, c: c)) {
                    case 0:
                        HStack{Image(systemName: "greaterthan.circle").padding();Text("Non è un equazione").background(Color.red).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding()
                    case 1:
                        HStack{Image(systemName: "greaterthan.circle").padding();Text("Eq. di 2 grado con 2 soluzioni coincidenti").background(Color.green).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding()
                    case 2:
                        HStack{Image(systemName: "greaterthan.circle").padding();Text("Eq. secondo grado, 2 soluzioni reali").background(Color.green).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding()
                    case -1:
                        HStack{Image(systemName: "greaterthan.circle").padding();Text("Eq. primo grado grado, 1 soluzione reale in x1").background(Color.green).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding()
                    case -2:
                        HStack{Image(systemName: "greaterthan.circle").padding();Text("Eq. secondo grado, 2 soluzioni immaginarie").background(Color.green).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding()
                    default:
                        HStack{Image(systemName: "greaterthan.circle").padding();Text("Numeri non validi").background(Color.red).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding()
                }
                Text("Nota: inserito i numeri il risultato si modificherà da solo!!!").font(.system(size: 13.0)).padding()
            }
        }.padding() .onTapGesture {hideKeyboard()}
    }
}

struct Exe2_Previews: PreviewProvider {
    static var previews: some View {
        Exe2()
    }
}
