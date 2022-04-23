//
//  Es2.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

import SwiftUI

struct Es2: View {
    @State private var button = true
    @State private var descrizioneFile = """

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
                    Image(systemName: "a.circle.fill").padding(30)
            TextField("Num1",  value: $a, format: .number)
                }
            
            Text("Inserisci il valore b dell'equazione:")
                HStack{
                    Image(systemName: "b.circle.fill").padding(30)
            TextField("Num2",  value: $b, format: .number)
                }
            Text("Inserisci il valore c dell'equazione:")
                HStack{
                    Image(systemName: "c.circle.fill").padding(30)
            TextField("Num2",  value: $c, format: .number)
                }
                
                
                switch (F1(a: a, b: b, c: c)) {
                    case 0:
                        HStack{Image(systemName: "greaterthan.circle.fill");Text("Non è un equazione").background(Color.green).cornerRadius(5)}
                    case 1:
                        HStack{Image(systemName: "greaterthan.circle.fill");Text("Eq. di 2 grado con 2 soluzioni coincidenti").background(Color.green).cornerRadius(5)}
                    case 2:
                        HStack{Image(systemName: "greaterthan.circle.fill");Text("Eq. secondo grado, 2 soluzioni reali").background(Color.green).cornerRadius(5)}
                    case -1:
                        HStack{Image(systemName: "greaterthan.circle.fill");Text("Eq. primo grado grado, 1 soluzione reale in x1").background(Color.green).cornerRadius(5)}
                    case -2:
                        HStack{Image(systemName: "greaterthan.circle.fill");Text("Eq. secondo grado, 2 soluzioni immaginarie").background(Color.green).cornerRadius(5)}
                    default:
                        HStack{Image(systemName: "equal.circle");Text("Numeri non validi").background(Color.green).cornerRadius(5)}
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


"""
    @State private var descrizioneFunzione = """

import Foundation
import SwiftUI
func F1(a: Double,b: Double,c: Double) -> Double {
    var x1 : Double = 0
    var x2 : Double = 0
    let delta = (b * b)+(-4 * a * c)
    if a==0{
        if b==0 {
            return 0
        }
        x1 = -c/b
        return -1
    }
    else
    {
      if delta == 0
        {
          x1 = (-b) / (2 * a)
          return 1
        }
        else if delta > 0
        {
          x1 = (-b + delta.squareRoot()) / (2 * a);
          x2 = (-b - delta.squareRoot()) / (2 * a);
           return 2;
        }
        else
        {
            return -2;
        }
    }
}



"""


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
            
            Text("Codice funzione:")
                .padding(.horizontal)
                .padding(.top)
                .font(.system(size: 15).bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView{
                Text(descrizioneFunzione)
                            .contextMenu {Button(action: {UIPasteboard.general.string = descrizioneFunzione}) {Text("Copia")}}
                .font(.system(size: 11.0))
            }
            .padding(.horizontal)
            .frame(height: 200, alignment: .top)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
            
            

            
            Text("Descrizione:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top)
                .font(.system(size: 17).bold())
            Text("Esercizio di che tipo è l'equazione di 2° grado?; in questo esercizio troviamo come inserire informazioni da parte dell'utente cambio colori e funzionalità già previste nell'esercizio precedente in più torviamo un file a parte con all'interno la funzione che permette l'identificazione dell' equazione in uscita abbiamo 1 numero e nel file principale troviamo uno switch che permette di assegnare all'numero di return la frase corretta per il risultato.").font(.caption).padding(.horizontal)
            Button(action: { }) {
                NavigationLink(destination: Exe2().navigationTitle("Equazione")){Text("Prova il codice")}
            }.buttonStyle(GradientButtonStyle()).padding(.top)
            }
        }
    }
}

struct Es2_Previews: PreviewProvider {
    static var previews: some View {
        Es2()
    }
}


