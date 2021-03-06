//
//  Es7.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 16/03/22.
//

import SwiftUI

struct Es7: View {
    @State private var descrizione = #"""
import SwiftUI
    
    struct Exe7: View {
        @State var Fill: CGFloat = 10
        @State var Fill1: CGFloat = 2
        @State var Colore: Color = Color.blue
        @State var fr: Double = 100
        @State var sr: Double = 10
        var body: some View {
            ScrollView {
                VStack {
                    Text("Scegli il Colore che vuoi:")
                    HStack{
                        Image(systemName: "largecircle.fill.circle").foregroundColor(Color.red).onTapGesture {Colore = Color.red}
                        Image(systemName: "largecircle.fill.circle").foregroundColor(Color.green).onTapGesture {Colore = Color.green}
                        Image(systemName: "largecircle.fill.circle").foregroundColor(Color.blue).onTapGesture {Colore = Color.blue}
                        Image(systemName: "largecircle.fill.circle").foregroundColor(Color.yellow).onTapGesture {Colore = Color.yellow}
                        Image(systemName: "largecircle.fill.circle").foregroundColor(Color.cyan).onTapGesture {Colore = Color.cyan}
                    }.padding().scaleEffect(1.8)
                    Text("Premi per riempire:").padding(.top)
                    ZStack {
                        Circle().stroke(Colore).frame(width: fr, height: fr, alignment: .center)
                        Circle().frame(width: Fill, alignment: .center).foregroundColor(Colore)
                        Image(systemName: "hand.tap").frame(width: fr, height: fr, alignment: .center)
                    }.onTapGesture {
                        if Fill >= fr || Fill1 == 1 {
                            Fill = Fill - sr
                            Fill1 = 1
                            if Fill <= 0 {
                                Fill1 = 0
                            }
                        } else {
                            Fill = Fill + sr
                        }
                        print(fr)
                        print(sr)
                    }
                    Text("Grandezza").padding(.top)
                    Slider(value: $fr, in: 40...200).padding(.horizontal)
                    Text("\(fr, specifier: "%.1f")")
                    Text("Velocit?? di riempimento").padding(.top)
                    let m = fr/2
                    Slider(value: $sr, in: 10...m).padding(.horizontal)
                    Text("\(sr, specifier: "%.1f")")
                }
            }.padding(.top)
        }
    }

    struct Exe7_Previews: PreviewProvider {
        static var previews: some View {
            Exe7()
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
                Text(descrizione)
                            .contextMenu {Button(action: {UIPasteboard.general.string = descrizione}) {Text("Copia")}}
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
            Text("Gioco riempi: gioca con gli slider e modificare i colori poi premi per riempire il cerchio ").font(.caption).padding(.horizontal)
            Button(action: { }) {
                NavigationLink(destination: Exe7().navigationTitle("Riempi")){Text("Prova il codice")}
            }.buttonStyle(GradientButtonStyle()).padding(.top)
            }
        }
    }
}

struct Es7_Previews: PreviewProvider {
    static var previews: some View {
        Es7()
    }
}
