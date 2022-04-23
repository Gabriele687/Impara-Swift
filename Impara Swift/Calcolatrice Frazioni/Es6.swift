//
//  Es6.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 28/02/22.
//

import SwiftUI

struct Es6: View {
    @State private var descrizione = #"""
import SwiftUI
struct Exe6: View {
    @State var Numeri: String = ""
    @State var f1: Frazione = Frazione(Numeratore: 1, Denominatore: 1)
    @State var f2: Frazione = Frazione(Numeratore: 1, Denominatore: 1)
    @State var opt: String = "";
    @State var Num1: Double = 0
    @State var Den1: Double = 1
    @FocusState var isInputActive: Bool
    var body: some View {
        ScrollView{
            Text("Prova Codice").font(.title.bold()).padding()
            VStack {
                TextField("\(Numeri)", text: $Numeri) .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1).frame(width: 252, height: 47, alignment: .center)).frame(width: 250, height: 45, alignment: .center).padding(.vertical).toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                        isInputActive = false
                            hideKeyboard()
                                        }
                                    }
                                }
                HStack{
                    Button("Copia risultato") {Copia()} .buttonStyle(Copy_Style())
                }
                VStack{
                    HStack{
                        Button("C") {Cancella()}.buttonStyle(CStyle())
                        Button("🔙") {TornaIndietro()}.buttonStyle(Red_Style()).padding(.horizontal, 3.5)
                        Button("/") {Numeratore_F()}.buttonStyle(Operator_2_Style())
                        Button("±") {Inverti()}.buttonStyle(Operator_2_Style())
                        Button("÷") {Divisione()}.buttonStyle(OperatorStyle())
                    }
                    HStack{
                        Button("%") {PerCento()}.buttonStyle(Operator_2_Style())
                        Button("eˣ") {PotenzaE()}.buttonStyle(Operator_2_Style())
                        Button("7") {Numeri += "7"}.buttonStyle(NumberStyle())
                        Button("8") {Numeri += "8"}.buttonStyle(NumberStyle())
                        Button("9") {Numeri += "9"}.buttonStyle(NumberStyle())
                        Button("x") {Moltiplica()}.buttonStyle(OperatorStyle())
                    }
                    HStack{
                        Button("ʸ√x") {RadiceY()}.buttonStyle(Operator_2_Style())
                        Button("xʸ") {PotenzaY()}.buttonStyle(Operator_2_Style())
                        Button("4") {Numeri += "4"}.buttonStyle(NumberStyle())
                        Button("5") {Numeri += "5"}.buttonStyle(NumberStyle())
                        Button("6") {Numeri += "6"}.buttonStyle(NumberStyle())
                        Button("-") {Sottrazione()}.buttonStyle(OperatorStyle())
                    }
                    HStack{
                        Button("∛x") {Radice3()}.buttonStyle(Operator_2_Style())
                        Button("x³") {Potenza3()}.buttonStyle(Operator_2_Style())
                        Button("1") {Numeri += "1"}.buttonStyle(NumberStyle())
                        Button("2") {Numeri += "2"}.buttonStyle(NumberStyle())
                        Button("3") {Numeri += "3"}.buttonStyle(NumberStyle())
                        Button("+") {Addizione()}.buttonStyle(OperatorStyle())
                    }
                    HStack{
                        Button("√x") {Radice2()}.buttonStyle(Operator_2_Style())
                        Button("x²") {Potenza2()}.buttonStyle(Operator_2_Style())
                        Button("0") {Numeri += "0"}.buttonStyle(Style0()).padding(.horizontal, 3.5)
                        Button(".") {Numeri += "."}.buttonStyle(NumberStyle())
                        Button("=") {Calcola()}.buttonStyle(OperatorStyle())
                    }
                }
            }.padding()
        }
    }
    private func Numeratore_F(){
        if Numeri == "" || Numeri == " "{
            return
        } else {
            Num1 = Double(Numeri)!
            Numeri += "/"
            print(Num1)
        }
    }
    private  func Denominatore_F(){
            var den: [Substring] = ["1"]
            den = Numeri.split(separator: "/")
        
            print(den.description)
            if den.description == "[]" || den.description == "[\"0\"]" || den.description == "[\"0.0\"]" || den.description == "[\"-\"]"{
                return
            } else  if den[0] == "0"{
                print("Divisione per 0")
                return
            } else if Numeri.contains("/"){
                Num1 = Double(den[0]) ?? 0.0
                Den1 =  Double(den[1]) ?? 1.0
                print(Num1)
            }else {
                Num1 = Double(den[0])!; Den1 = 1; print(Num1)
            }
        Numeri = ""
    }
    private func Virgola(){
        Numeri += "."
    }
    private func Cancella(){
        Numeri = ""
        print("*********CANCELLATO********")
    }
    private func TornaIndietro(){
        if Numeri == "" {
            print("Campo vuoto")
        }else{
            Numeri.remove(at: Numeri.index(before: Numeri.endIndex))
            print("********BACK********")
        }
    }
    private func Potenza2() {
        Denominatore_F()
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        let ris = Frazione.E_XN(f1: f1, nVolte: 2).Semplifica()
        Numeri = "\(ris.Numeratore.Togli0())/\(ris.Denominatore.Togli0())"
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func Potenza3() {
        Denominatore_F()
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        let ris = Frazione.E_XN(f1: f1, nVolte: 3).Semplifica()
        Numeri = "\(ris.Numeratore.Togli0())/\(ris.Denominatore.Togli0())"
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func PotenzaY() {
        Denominatore_F()
        opt = "^Y"
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        Numeri = ""
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func PotenzaE() {
        Denominatore_F()
        opt = "^E"
        Numeri = ""
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func Radice2() {
        Denominatore_F()
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        var ris = Frazione.Radice2(f1: f1)
        ris = round(ris)
        Numeri = "\(ris.Togli0())"
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func Radice3() {
        Denominatore_F()
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        var ris = Frazione.Radice3(f1: f1)
        ris = round(ris)
        Numeri = "\(ris.Togli0())"
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func RadiceY() {
        Denominatore_F()
        opt = "√Y"
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        Numeri = ""
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func Moltiplica() {
        Denominatore_F()
        opt = "*"
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        Numeri = ""
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func Divisione() {
        Denominatore_F()
        opt = "/"
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        Numeri = ""
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func Addizione() {
        Denominatore_F()
        opt = "+"
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        Numeri = ""
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func Sottrazione() {
        if (Numeri == ""){
            Denominatore_F()
            opt = "-"
            f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
            Numeri = Numeri + "-";
        }
        else{
            Denominatore_F()
            opt = "-"
            f1 =  Frazione(Numeratore: Num1, Denominatore: Den1)
            Numeri = ""
        }
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func PerCento() {
        Denominatore_F()
        opt = "%"
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        Numeri = "\((f1.Numeratore / f1.Denominatore) / 100)"
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func Inverti() {
        if (Numeri.contains("-")){
            Numeri = Numeri.replacingOccurrences(of: "-", with: "")
        }
        else if (Numeri.contains("+") || Numeri.contains("")){
            Numeri = "-" + Numeri
        }
    }
    private func Calcola(){
        if Numeri.contains("/") {
            let den = Numeri.split(separator: "/")
            f1 = Frazione(Numeratore: Double(den[0])!, Denominatore: 1)
            Denominatore_F()
            f2 = Frazione(Numeratore: Double(den[1])!, Denominatore: 1)
            var risultato: Frazione =  Frazione(Numeratore: 0, Denominatore: 1)
            risultato = Frazione.Divisione(f1: f1, f2: f2)
            risultato = risultato.Semplifica()
            let r1 = risultato.Numeratore
            let r2 = risultato.Denominatore
            if (r2 == 1)
            {
                Numeri = "\(r1)";
            }
            else
            {
                Numeri = "\(r1)/\(r2)";
            }
        } else{
            Denominatore_F()
            f2 = Frazione(Numeratore: Num1, Denominatore: Den1)
            var risultato = Frazione(Numeratore: 0, Denominatore: 1)
            switch opt{
            case "*":
                risultato = Frazione.Prodotto(f1: f1, f2: f2)
                break;
            case "/":
                risultato = Frazione.Divisione(f1: f1, f2: f2)
                break;
            case "-":
                risultato = Frazione.Sottrazione(f1: f1, f2: f2)
                break;
            case "+":
                risultato = Frazione.Somma(f1: f1, f2: f2)
                break;
            case "^Y":
                let n: Double = f2.Numeratore / f2.Denominatore
                risultato = Frazione.E_XN(f1: f1, nVolte: n)
                var ris: Double = risultato.Numeratore / risultato.Denominatore
                ris = round(ris)
                Numeri = "\(ris.Togli0())"
                return;
            case "^E":
                let n1: Double = f2.Numeratore / f2.Denominatore
                var ris1: Double = Frazione.E_E(nVolte: n1)
                ris1 = round(ris1)
                Numeri = "\(ris1.Togli0())"
                return;
            case "√Y":
                var ris2: Double = Frazione.RadiceY(f1: f1, f2: f2)
                ris2 = round(ris2)
                Numeri = "\(ris2.Togli0())"
                return
            default:
                return
            }
            print("***\(f2.Numeratore)/\(f2.Denominatore)")
            risultato = risultato.Semplifica()
            let r1 = risultato.Numeratore
            let r2 = risultato.Denominatore
            if (r2 == 1)
            { Numeri = "\(r1.Togli0())" }
            else{ Numeri = "\(r1.Togli0())/\(r2.Togli0())" }
        }
    }
    private func Copia(){
        let pasteboard = UIPasteboard.general
        pasteboard.string = Numeri
    }
}


struct Exe6_Previews: PreviewProvider {
    static var previews: some View {
        Exe6()
    }
}
"""#
    @State private var Classe = #"""
 import Foundation
    class Frazione {
        
        public var Numeratore: Double = 0;
        public var Denominatore: Double = 1;
        init(Numeratore: Double, Denominatore: Double) {
                self.Numeratore = Numeratore
                self.Denominatore = Denominatore
            }
        
        public func Frazione(numeratore: Double, denominatore: Double){
            Numeratore = numeratore;
            Denominatore = denominatore;
        }
        public func Frazione(s: String){
            if s.isEmpty {
                return
            }
            let elementi: [Substring] = s.split(separator: "/")
            Numeratore = Double(elementi[0])!
            if elementi.count <= 1 {
                Denominatore = 1;
            }
            else{
                Denominatore = Double(elementi[1])!
            }
        }
        public func Frazione() {}
        public static func Somma(f1: Frazione, f2:Frazione) -> Frazione {
            let Ris: Frazione = Impara_Swift.Frazione(Numeratore: f1.Numeratore * f2.Denominatore + f1.Denominatore * f2.Numeratore, Denominatore: f1.Denominatore * f2.Denominatore)
            return Ris
        }
        public static func Prodotto(f1: Frazione, f2:Frazione) -> Frazione {
            let Ris: Frazione = Impara_Swift.Frazione(Numeratore: f1.Numeratore * f2.Numeratore, Denominatore: f1.Denominatore * f2.Denominatore)
            return Ris
        }
        public static func E_XN(f1: Frazione, nVolte: Double) -> Frazione {
            let Ris: Frazione = Impara_Swift.Frazione(Numeratore: pow(f1.Numeratore, nVolte),Denominatore: pow(f1.Denominatore, nVolte))
            return Ris
        }
        public static func Radice2(f1: Frazione) -> Double {
            let n = f1.Numeratore / f1.Denominatore
            return sqrt(n)
        }
        public static func Radice3(f1: Frazione) -> Double {
            let n = f1.Numeratore / f1.Denominatore
            return cbrt(n)
        }
        public static func RadiceY(f1: Frazione, f2: Frazione) -> Double {

            let p: Double = 0.001
            let A: Double = f1.Numeratore / f1.Denominatore
            let n: Double = f2.Numeratore / f2.Denominatore
            let _n: Double = n
            var x: [Double] = [2]
            x[0] = A
            x[1] = A / _n
            while (abs(x[0] - x[1]) > p)
            {
                x[1] = x[0];
                x[0] = (1 / _n) * (((_n - 1) * x[1]) + (A / pow(x[1], _n - 1)))
            }
            return x[0]
        }
        public static func E_E(nVolte: Double) -> Double {
            return pow(M_E, nVolte)
        }
        public static func Divisione(f1: Frazione, f2:Frazione) -> Frazione {
            let Ris: Frazione = Impara_Swift.Frazione(Numeratore: f1.Numeratore * f2.Denominatore, Denominatore: f1.Denominatore * f2.Numeratore)
            return Ris
        }
        public static func Sottrazione(f1: Frazione, f2:Frazione) -> Frazione {
            let F2: Frazione = Impara_Swift.Frazione.Sottrazione(f: f2)
            return Impara_Swift.Frazione.Somma(f1: f1, f2: F2)
        }
        public static func Sottrazione(f: Frazione) -> Frazione {
            return Impara_Swift.Frazione(Numeratore: -f.Numeratore, Denominatore: f.Denominatore)
        }
        public static func MinimoComuneMultiplo(n1: Double, n2: Double) -> Double {
            var i = max(n1, n2)
            while i < (n1 * n2) {
                let mod = i.truncatingRemainder(dividingBy: n1)
                let mod2 = i.truncatingRemainder(dividingBy: n2)
                if mod == 0 && mod2 == 0 {
                    return i;
                }
                i = i+1;
            }
            return n1 * n2;
        }
        public static func Segno(f: Frazione) -> Int {
            let a = f.Numeratore * f.Denominatore
            return Int(a).signum()
        }
        public static func MinimoComuneDivisore(n1: Double, n2: Double) -> Double {
            var i = min(n1, n2)
            while i > 1 {
                let mod = n1.truncatingRemainder(dividingBy: i)
                let mod2 = n2.truncatingRemainder(dividingBy: i)
                if mod == 0 && mod2 == 0 {
                    return i;
                }
            i = i-1
            }
            return 1
        }
        public func Semplifica() -> Frazione {
            let mcd: Double = Impara_Swift.Frazione.MinimoComuneDivisore(n1: Numeratore, n2: Denominatore)
            return Impara_Swift.Frazione(Numeratore: Numeratore / mcd, Denominatore: Denominatore / mcd)
        }
    }
 """#
    @State private var Stili = #"""
 import Foundation
 import SwiftUI

 struct Operator_2_Style: ButtonStyle {
     func makeBody(configuration: Self.Configuration) -> some View {
         configuration.label
             .frame(width: 35, height: 28, alignment: .center)
             .foregroundColor(Color.black)
             .background(Color.gray)
             .cornerRadius(100)
             .scaleEffect(configuration.isPressed ? 1.0 : 1.2)
             .font(.system(size: 15).bold())
     }
 }
 struct OperatorStyle: ButtonStyle {
     func makeBody(configuration: Self.Configuration) -> some View {
         configuration.label
             .frame(width: 35, height: 28, alignment: .center)
             .foregroundColor(Color.black)
             .background(Color.orange)
             .cornerRadius(100)
             .scaleEffect(configuration.isPressed ? 1.0 : 1.2)
             .font(.system(size: 15).bold())
     }
 }
 struct NumberStyle: ButtonStyle {
     func makeBody(configuration: Self.Configuration) -> some View {
         configuration.label
             .frame(width: 35, height: 28, alignment: .center)
             .foregroundColor(Color.black)
             .background(Color.init(uiColor: UIColor.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)))
             .cornerRadius(100)
             .scaleEffect(configuration.isPressed ? 1.0 : 1.2)
             .font(.system(size: 15).bold())
     }
 }
 struct Style0: ButtonStyle {
     func makeBody(configuration: Self.Configuration) -> some View {
         configuration.label
             .frame(width: 70, height: 28, alignment: .center)
             .foregroundColor(Color.black)
             .background(Color.init(uiColor: UIColor.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)))
             .cornerRadius(100)
             .scaleEffect(configuration.isPressed ? 1.0 : 1.2)
             .font(.system(size: 15).bold())
     }
 }
 struct Copy_Style: ButtonStyle {
     func makeBody(configuration: Self.Configuration) -> some View {
         configuration.label
             .frame(width: 180, height: 20, alignment: .center)
             .foregroundColor(Color.white)
             .background(Color.init(uiColor: UIColor.black))
             .cornerRadius(100)
             .scaleEffect(configuration.isPressed ? 1.0 : 1.2)
             .font(.system(size: 10).bold())
     }
 }
 struct Red_Style: ButtonStyle {
     func makeBody(configuration: Self.Configuration) -> some View {
         configuration.label
             .frame(minWidth: 25, idealWidth: 25, maxWidth: 71, minHeight: 28, idealHeight: 28, maxHeight: 18, alignment: .center)
             .foregroundColor(Color.white)
             .background(Color.red)
             .cornerRadius(100)
             .scaleEffect(configuration.isPressed ? 1.0 : 1.2)
             .font(.system(size: 15).bold())
     }
 }
 struct CStyle: ButtonStyle {
     func makeBody(configuration: Self.Configuration) -> some View {
         configuration.label
             .frame(width: 35, height: 28, alignment: .center)
             .foregroundColor(Color.white)
             .background(Color.red)
             .cornerRadius(100)
             .scaleEffect(configuration.isPressed ? 1.0 : 1.2)
             .font(.system(size: 15).bold())
     }
 }
 """#
    var body: some View {
        ScrollView{
        VStack(){
            Text("Codice View:")
                .font(.system(size: 15).bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            ScrollView{
                Text(descrizione)
                .contextMenu {Button(action: {UIPasteboard.general.string = descrizione}) {Text("Copia")}}
                .font(.system(size: 11.0)) }
                .padding(.horizontal)
                .frame(height: 350, alignment: .top)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding(.horizontal,10)
            Text("Codice Classe:")
                .font(.system(size: 15).bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            ScrollView{
                Text(Classe)
                .contextMenu {Button(action: {UIPasteboard.general.string = Classe}) {Text("Copia")}}
                .font(.system(size: 11.0)) }
                .padding(.horizontal)
                .frame(height: 350, alignment: .top)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding(.horizontal,10)
            Text("Codice Stili bottoni:")
                .font(.system(size: 15).bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            ScrollView{
                Text(Stili)
                .contextMenu {Button(action: {UIPasteboard.general.string = Stili}) {Text("Copia")}}
                .font(.system(size: 11.0)) }
                .padding(.horizontal)
                .frame(height: 350, alignment: .top)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding(.horizontal,10)
            
            Text("Descrizione:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .font(.system(size: 17).bold())
            Text("Esercizio Calcolatrice Frazioni puoi inserire frazioni e fare calcoli qui hai tre file il primo classico il file View poi c'è la classe Frazione che definisce l'oggetto frazione e fa le operazioni basiche e hai un file con i vari stili dei bottoni buon divertimento!!!").font(.caption).padding(.horizontal)                .textSelection(.enabled)
            
            Button(action: { }) {
                NavigationLink(destination: Exe6().navigationTitle("Frazioni")){Text("Prova il codice")}
            }.buttonStyle(GradientButtonStyle()).padding(.top)
            Spacer()
            }
        }
    }
}

struct Es6_Previews: PreviewProvider {
    static var previews: some View {
        Es6()
    }
}
