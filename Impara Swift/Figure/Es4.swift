//
//  Es4.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

import SwiftUI
import SwiftUI

struct Es4: View{
    let generator = UINotificationFeedbackGenerator()
    @State private var button = true
    @State private var Figura = " "
    @State private var descrizioneFile1 = #"""
import SwiftUI

struct Exe4: View {
    @State private var Base: Double = 1
    @State private var Altezza: Double = 1
    @State private var risultato = "Ris"
        var body: some View {
            ScrollView {
                VStack{
                Text("Prova Codice").font(.title.bold()).padding(.bottom)
                
                Text("Inserisci la base del triangolo:")
                    HStack{
                        Image(systemName: "arrow.left.arrow.right").padding(30)
                TextField("Base",  value: $Base, format: .number).keyboardType(.numberPad)
                    }.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                
                Text("Inserisci l'altezza del triangolo:")
                    HStack{
                        Image(systemName: "arrow.up.arrow.down").padding(30)
                TextField("Altezza",  value: $Altezza, format: .number).keyboardType(.numberPad)
                    }.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                    var Area = 0.0
                    var Perimetro = 0.0
                    let Ris = TriangoloRettangolo(base: Base, altezza: Altezza, area: &Area, perimetro: &Perimetro)
                    switch Ris.0 {
                    case true:
                        HStack{Image(systemName: "triangle").padding();Text("\(String(format: "Area: %.2f", Ris.2))\n\(String(format: "Perimetro: %.2f", Ris.1)) ").background(Color.green).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                    case false:
                        HStack{
                            Image(systemName: "triangle").padding();Text("Non è un triangolo!").background(Color.red).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                    }
                    Text("Nota: inserito i numeri il risultato e la figura si modificherà da solo!!!").font(.system(size: 12.0))
                    

                    
                    

                    
                    Text("Figura:")
                    if (Base >= 2 || Altezza >= 2 ) && (Base < 9 && Altezza < 9){
                        Text("Scala: 1:20").font(.system(size: 12))
                        Triangolo(scala: 20, Base: Base, Altezza: Altezza).stroke().frame(height: Altezza*20)
                    }else if (Base >= 9 || Altezza >= 9 ) && (Base < 18 && Altezza < 18) {
                        Text("Scala: 1:10").font(.system(size: 12))
                        Triangolo(scala: 10, Base: Base, Altezza: Altezza).stroke().frame(height: Altezza*10)
                    }else if (Base >= 18 || Altezza >= 18 ) && (Base < 38 && Altezza < 38) {
                        Text("Scala: 1:5").font(.system(size: 12))
                        Triangolo(scala: 5, Base: Base, Altezza: Altezza).stroke().frame(height: Altezza*5)
                    }else if (Base >= 38 || Altezza >= 38 ) && (Base < 100 && Altezza < 100) {
                        Text("Scala: 1:2").font(.system(size: 12))
                        Triangolo(scala: 2, Base: Base, Altezza: Altezza).stroke().frame(height: Altezza*2)
                    }else if (Base >= 100 || Altezza >= 100 ) && (Base < 120 && Altezza < 120) {
                        Text("Scala: 1:1").font(.system(size: 12))
                        Triangolo(scala: 1, Base: Base, Altezza: Altezza).stroke().frame(height: Altezza*1)
                    }else if (Base >= 120 || Altezza >= 120 ) && (Base <= 150 && Altezza <= 150) {
                        Text("Scala: 1:0.9").font(.system(size: 12))
                        let baset = 100+Base/0.9
                            Path{ path in
                                path.move(to: CGPoint(x: 100, y: 0))
                                path.addLine(to: CGPoint(x:100, y: Altezza/0.9))
                                path.addLine(to: CGPoint(x: baset, y: Altezza/0.9))
                                path.addLine(to: CGPoint(x: 100, y: 0))}.stroke().frame(height: Altezza/0.9)
                    }else if Base > 150 || Altezza > 150 {
                        Text("Numeri troppo grandi per raffigurare il triangolo!!!").bold().foregroundColor(Color.red)
                    }else if Base < 2 || Altezza < 2{
                        Text("Scala: 1:100").font(.system(size: 12))
                        Triangolo(scala: 100, Base: Base, Altezza: Altezza).stroke().frame(height: Altezza*100)
                    }
            }.padding() .onTapGesture {hideKeyboard()}
        }
    }
}

struct Exe4_Previews: PreviewProvider {
    static var previews: some View {
        Exe4()
    }
}



"""#
    @State private var descrizioneFile2 = #"""
import SwiftUI
import UIKit

struct Exe401: View {
    @State private var SemiasseMaggiore: Double = 2
    @State private var SemiasseMinore: Double = 1
    @State private var risultato = "Ris"
        var body: some View {
            ScrollView {
                VStack{
                    Text("Prova Codice").font(.title.bold()).padding(.bottom)
                    ZStack{
                        Path{ path in
                           path.move(to: CGPoint(x: 30, y: 65))
                           path.addLine(to: CGPoint(x:320, y: 65))
                        }.stroke(lineWidth: 0.6)
                        Path{ path in
                           path.move(to: CGPoint(x: 175, y: 65))
                           path.addLine(to: CGPoint(x:272, y: 65))
                        }.stroke(Color.red, lineWidth: 1)
                        Path{ path in
                           path.move(to: CGPoint(x: 0, y: 0))
                           path.addLine(to: CGPoint(x:100, y: 0))
                        }.stroke(Color.red, lineWidth: 1)
                        Text("Semiasse Maggiore").font(.system(size: 8).bold()).position(x: 40, y: 10)
                        Path{ path in
                           path.move(to: CGPoint(x: 175, y: 0))
                           path.addLine(to: CGPoint(x:175, y: 130))
                        }.stroke(lineWidth: 0.6)
                        Path{ path in
                           path.move(to: CGPoint(x: 175, y: 16))
                           path.addLine(to: CGPoint(x:175, y: 65))
                        }.stroke(Color.blue, lineWidth: 1)
                        Path{ path in
                           path.move(to: CGPoint(x: 0, y: 20))
                           path.addLine(to: CGPoint(x:100, y: 20))
                        }.stroke(Color.blue, lineWidth: 1)
                        Text("Semiasse Minore").font(.system(size: 8).bold()).position(x: 35, y: 30)
                        Ellipse().stroke().frame(width: 200, height: 100).padding(.top)
                    }
                Text("Inserisci il semiasse maggiore:")
                    HStack{
                        Image(systemName: "arrow.left.arrow.right").padding(30)
                TextField("Semiasse Maggiore",  value: $SemiasseMaggiore, format: .number).keyboardType(.numberPad)
                    }.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                
                Text("Inserisci il semiasse minore:")
                    HStack{
                        Image(systemName: "arrow.up.arrow.down").padding(30)
                TextField("Semiasse Minore",  value: $SemiasseMinore, format: .number).keyboardType(.numberPad)
                    }.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                    var Area = 0.0
                    var Perimetro = 0.0
                    let Ris = Ellisse(SemiasseMaggiore: SemiasseMaggiore, SemiasseMinore: SemiasseMinore, area: &Area, perimetro: &Perimetro)
                    switch Ris.0 {
                    case true:
                        if SemiasseMaggiore > SemiasseMinore {
                            HStack{Image(systemName: "capsule").padding();Text("\(String(format: "Area: %.2f", Ris.2))\n\(String(format: "Perimetro: %.2f", Ris.1)) ").background(Color.green).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                        } else{
                            HStack{Image(systemName: "capsule.portrait").padding();Text("\(String(format: "Area: %.2f", Ris.2))\n\(String(format: "Perimetro: %.2f", Ris.1)) ").background(Color.green).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                        }
                    case false:
                        HStack{
                            Image(systemName: "triangle").padding();Text("Non è un Ellisse!").background(Color.red).cornerRadius(6).padding(.horizontal,4).font(.system(size: 15).bold())}.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                    }
                    Text("Figura:")
                    if SemiasseMaggiore > SemiasseMinore{
                        if (SemiasseMaggiore <= 2 && SemiasseMinore <= 2) {
                            Text("Scala: 1:100").font(.system(size: 12))
                            Ellipse()
                                .stroke()
                                .frame(width: SemiasseMaggiore*100, height: SemiasseMinore*100)
                        }else if (SemiasseMaggiore >= 3 || SemiasseMinore >= 3 ) && (SemiasseMaggiore < 9 && SemiasseMinore < 9) {
                            Text("Scala: 1:30").font(.system(size: 12))
                            Ellipse()
                                .stroke()
                                .frame(width: SemiasseMaggiore*30, height: SemiasseMinore*30)
                        }else if (SemiasseMaggiore >= 9 || SemiasseMinore >= 9 ) && (SemiasseMaggiore < 38 && SemiasseMinore < 38) {
                            Text("Scala: 1:10").font(.system(size: 12))
                            Ellipse()
                                .stroke()
                                .frame(width: SemiasseMaggiore*10, height: SemiasseMinore*10)
                        }else if (SemiasseMaggiore >= 38 || SemiasseMinore >= 38 ) && (SemiasseMaggiore < 120 && SemiasseMinore < 120) {
                            Text("Scala: 1:2").font(.system(size: 12))
                            Ellipse()
                                .stroke()
                                .frame(width: SemiasseMaggiore*2, height: SemiasseMinore*2)
                        }else if (SemiasseMaggiore >= 120 || SemiasseMinore >= 120 ) && (SemiasseMaggiore <= 150 && SemiasseMinore <= 150) {
                            Text("Scala: 1:0.9").font(.system(size: 12))
                            Ellipse()
                                .stroke()
                                .frame(width: SemiasseMaggiore/0.9, height: SemiasseMinore/0.9)
                        }else if SemiasseMaggiore > 150 || SemiasseMinore > 150 {
                            Text("Numeri troppo grandi per raffigurare l'ellisse!!!").bold().foregroundColor(Color.red)
                        }
                    } else if SemiasseMinore > SemiasseMaggiore{
                        if (SemiasseMinore <= 2 && SemiasseMaggiore <= 2) {
                            Text("Scala: 1:100").font(.system(size: 12))
                            Ellipse()
                                .stroke()
                                .frame(width: SemiasseMaggiore*100, height: SemiasseMinore*100)
                        }else if (SemiasseMinore >= 3 || SemiasseMaggiore >= 3 ) && (SemiasseMinore < 9 && SemiasseMaggiore < 9) {
                            Text("Scala: 1:30").font(.system(size: 12))
                            Ellipse()
                                .stroke()
                                .frame(width: SemiasseMaggiore*30, height: SemiasseMinore*30)
                        }else if (SemiasseMinore >= 9 || SemiasseMaggiore >= 9 ) && (SemiasseMinore < 38 && SemiasseMaggiore < 38) {
                            Text("Scala: 1:10").font(.system(size: 12))
                            Ellipse()
                                .stroke()
                                .frame(width: SemiasseMaggiore*10, height: SemiasseMinore*10)
                        }else if (SemiasseMinore >= 38 || SemiasseMaggiore >= 38 ) && (SemiasseMinore < 120 && SemiasseMaggiore < 120) {
                            Text("Scala: 1:2").font(.system(size: 12))
                            Ellipse()
                                .stroke()
                                .frame(width: SemiasseMaggiore*2, height: SemiasseMinore*2)
                        }else if (SemiasseMinore >= 120 || SemiasseMaggiore >= 120 ) && (SemiasseMinore <= 150 && SemiasseMaggiore <= 150) {
                            Text("Scala: 1:0.9").font(.system(size: 12))
                            Ellipse()
                                .stroke()
                                .frame(width: SemiasseMaggiore/0.9, height: SemiasseMinore/0.9)
                        }else if SemiasseMinore > 150 || SemiasseMaggiore > 150 {
                            Text("Numeri troppo grandi per raffigurare l'ellisse!!!").bold().foregroundColor(Color.red)
                        }
                    }
                    else if SemiasseMinore == SemiasseMaggiore {
                        Text("Non è un'ellisse è un triangolo!!!").bold().foregroundColor(Color.red)
                    }
            }.padding() .onTapGesture {hideKeyboard()}
        }
    }
}

struct Exe401_Previews: PreviewProvider {
    static var previews: some View {
        Exe401()
    }
}


"""#
    @State private var descrizioneFunzione1 = """

import Foundation
import SwiftUI

func TriangoloRettangolo(base: Double, altezza: Double, area: inout Double, perimetro: inout Double) -> (Bool,Double,Double) {
    if (base <= 0 || altezza <= 0)
    {
        perimetro = 0
        area = 0
        return (false,perimetro,area)
        
    }
    perimetro = 0
    area = 0
    area = (base * altezza) / 2
    perimetro = (pow(base, 2) + pow(altezza, 2)).squareRoot()
    return (true,perimetro,area)
}
func Triangolo(scala: Double, Base: Double, Altezza: Double) -> (Path) {
    let baset = 100+Base*scala
         return Path{ path in
            path.move(to: CGPoint(x: 100, y: 0))
            path.addLine(to: CGPoint(x:100, y: Altezza*scala))
            path.addLine(to: CGPoint(x: baset, y: Altezza*scala))
             path.addLine(to: CGPoint(x: 100, y: 0))}
}
func Ellisse(SemiasseMaggiore: Double, SemiasseMinore: Double, area: inout Double, perimetro: inout Double) -> (Bool,Double,Double) {
    if (SemiasseMaggiore <= 0 || SemiasseMinore <= 0)
    {
        perimetro = 0
        area = 0
        return (false,perimetro,area)
        
    }
    perimetro = 0
    area = 0
    area = SemiasseMaggiore * SemiasseMinore * Double.pi;
    perimetro = (((pow(SemiasseMaggiore, 2) + pow(SemiasseMinore, 2))/2).squareRoot())*2*Double.pi;
    return (true,perimetro,area)
}



"""
    var body: some View {
        ScrollView {
        VStack(){
            switch Figura {
            case "Triangolo":
                VStack(){
                    Text("Triangolo").font(.title)
                Text("Codice Main file:")
                    .padding(.horizontal)
                    .padding(.top)
                    .font(.system(size: 15).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView{
                    Text(descrizioneFile1)
                       
                        .contextMenu {Button(action: {UIPasteboard.general.string = descrizioneFile1}) {Text("Copia")}}
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
                    Text(descrizioneFunzione1)
                                .contextMenu {Button(action: {UIPasteboard.general.string = descrizioneFunzione1}) {Text("Copia")}}
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
                Text("Esercizio Area e Perimetro di un triangolo rettangolo in questo esercizio troviamo come inserire informazioni da parte dell'utente cambio colori e funzionalità già previste nell'esercizio precedente in più torviamo un file a parte con all'interno la funzione che permette l'identificazione dell' equazione in uscita abbiamo un true o false che a seconda del risultato uno switch stabilisce se i dati inseriti sono corretti.").font(.caption).padding(.horizontal)
                }
                Button(action: { }) {
                    NavigationLink(destination: Exe4().navigationTitle("Area e Perimetro")){Text("Prova il codice")}
                }.buttonStyle(GradientButtonStyle()).padding(.top)
            case "Ellisse":
                VStack(){
                    Text("Ellisse").font(.title)
                Text("Codice Main file:")
                    .padding(.horizontal)
                    .padding(.top)
                    .font(.system(size: 15).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView{
                    Text(descrizioneFile2)
                                .contextMenu {Button(action: {UIPasteboard.general.string = descrizioneFile1}) {Text("Copia")}}
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
                    Text(descrizioneFunzione1)
                                .contextMenu {Button(action: {UIPasteboard.general.string = descrizioneFunzione1}) {Text("Copia")}}
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
                Text("Esercizio Area e Perimetro di un Ellisse: in questo esercizio troviamo come inserire informazioni da parte dell'utente cambio colori e funzionalità già previste nell'esercizio precedente in più torviamo un file a parte con all'interno la funzione che permette l'identificazione dell' equazione in uscita abbiamo un true o false che a seconda del risultato uno switch stabilisce se i dati inseriti sono corretti.").font(.caption).padding(.horizontal)
                }
                Button(action: { }) {
                    NavigationLink(destination: Exe401().navigationTitle("Area e Perimetro")){Text("Prova il codice")}
                }.buttonStyle(GradientButtonStyle()).padding(.top)
            default:
                VStack(){
                    Text("Triangolo").font(.title)
                Text("Codice Main file:")
                    .padding(.horizontal)
                    .padding(.top)
                    .font(.system(size: 15).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView{
                    Text(descrizioneFile1)
                                .contextMenu {Button(action: {UIPasteboard.general.string = descrizioneFile1}) {Text("Copia")}}
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
                    Text(descrizioneFunzione1)
                                .contextMenu {Button(action: {UIPasteboard.general.string = descrizioneFunzione1}) {Text("Copia")}}
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
                Text("Esercizio Area e Perimetro di un triangolo rettangolo in questo esercizio troviamo come inserire informazioni da parte dell'utente cambio colori e funzionalità già previste nell'esercizio precedente in più torviamo un file a parte con all'interno la funzione che permette l'identificazione dell' equazione in uscita abbiamo un true o false che a seconda del risultato uno switch stabilisce se i dati inseriti sono corretti.").font(.caption).padding(.horizontal)
                }
                Button(action: { }) {
                    NavigationLink(destination: Exe4().navigationTitle("Area e Perimetro")){Text("Prova il codice")}
                }.buttonStyle(GradientButtonStyle()).padding(.top)
            }
            
            }
        }.toolbar {
            ToolbarItem(placement: .primaryAction) {
                Menu {
                    Button(action: {Figura="Triangolo"}) {
                        Label("Triangolo", systemImage: "triangle")
                    }

                    Button(action: {Figura="Ellisse"}) {
                        Label("Ellisse", systemImage: "capsule")
                    }
                }
                label: {
                    Label("Scegli Figura", systemImage: "chevron.down")
                        .labelStyle(.titleAndIcon)
                }
            }
        }
    }
}

struct Es4_Previews: PreviewProvider {
    static var previews: some View {
        Es4()
    }
}
