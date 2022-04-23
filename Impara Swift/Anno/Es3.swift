//
//  Es3.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

import SwiftUI

struct Es3: View {
    @State private var button = true
    @State private var descrizioneFile = """

import SwiftUI

struct Exe3: View {
    @State private var Anno: Int = 0
    var body: some View {
        ScrollView {
            
           VStack{
               Text("Prova codice").font(.title.bold()).padding(.bottom)
               Text("Controlla se l'anno è bisestile").padding(.bottom).font(.caption.bold())
            Text("Inserisci l'anno:")
                HStack{
                    Image(systemName: "globe.europe.africa.fill").padding(30)
            TextField("a",  value: $Anno, format: .number)
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



"""
    @State private var descrizioneFunzione = """

import SwiftUI

func Bisestile(anno: Int) -> Bool {
    if (anno % 4 == 0){
        if (anno % 100 == 0){
            if (anno % 1000 == 0){
                return true;
            }else{
                return false;
            }
        }else{
            return true;
        }
    }else{
        return false;
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
                .font(.system(size: 11.0))}
            .padding(.horizontal)
            .frame(height: 200, alignment: .top)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
            
            

            
            Text("Descrizione:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top)
                .font(.system(size: 17).bold())
            Text("Esercizio l'anno è bisestile? in questo esercizio troviamo come inserire informazioni da parte dell'utente cambio colori e funzionalità già previste negli esercizi precedenti in più torviamo un file a parte con all'interno la funzione che permette l'identificazione dell'anno se è bisestile e nel file principale troviamo uno switch che permette di assegnare al valore di return (true o false) la frase corretta per il risultato.").font(.caption).padding(.horizontal)
            Button(action: { }) {
                NavigationLink(destination: Exe3().navigationTitle("Anno")){Text("Prova il codice")}
            }.buttonStyle(GradientButtonStyle()).padding(.top)
            }
        }
    }
}

struct Es3_Previews: PreviewProvider {
    static var previews: some View {
        Es3()
    }
}
