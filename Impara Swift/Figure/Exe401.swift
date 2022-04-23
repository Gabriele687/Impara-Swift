//
//  Exe401.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

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
