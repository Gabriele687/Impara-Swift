//
//  Exe4.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

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


