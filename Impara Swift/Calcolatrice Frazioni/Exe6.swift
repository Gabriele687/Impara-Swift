//
//  Exe6.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 28/02/22.
//

import SwiftUI
struct Exe6: View {
    @State var Numeri: String = ""
    @State var f1: Frazione = Frazione(Numeratore: 1, Denominatore: 1)
    @State var f2: Frazione = Frazione(Numeratore: 1, Denominatore: 1)
    @State var opt: String = "";
    @State var Num1: Double = 0
    @State var Den1: Double = 1
    @FocusState var isInputActive: Bool
    @State var Lista: [String] = []
    @State var List: String = ""
    @State var v: Bool = false
    
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
                        Button("7") {Numeri += "7"; List += "7"}.buttonStyle(NumberStyle())
                        Button("8") {Numeri += "8"; List += "8"}.buttonStyle(NumberStyle())
                        Button("9") {Numeri += "9"; List += "9"}.buttonStyle(NumberStyle())
                        Button("x") {Moltiplica()}.buttonStyle(OperatorStyle())
                    }
                    HStack{
                        Button("ʸ√x") {RadiceY()}.buttonStyle(Operator_2_Style())
                        Button("xʸ") {PotenzaY()}.buttonStyle(Operator_2_Style())
                        Button("4") {Numeri += "4";  List += "4"}.buttonStyle(NumberStyle())
                        Button("5") {Numeri += "5";  List += "5"}.buttonStyle(NumberStyle())
                        Button("6") {Numeri += "6";  List += "6"}.buttonStyle(NumberStyle())
                        Button("-") {Sottrazione()}.buttonStyle(OperatorStyle())
                    }
                    HStack{
                        Button("∛x") {Radice3()}.buttonStyle(Operator_2_Style())
                        Button("x³") {Potenza3()}.buttonStyle(Operator_2_Style())
                        Button("1") {Numeri += "1";  List += "1"}.buttonStyle(NumberStyle())
                        Button("2") {Numeri += "2";  List += "2"}.buttonStyle(NumberStyle())
                        Button("3") {Numeri += "3";  List += "3"}.buttonStyle(NumberStyle())
                        Button("+") {Addizione()}.buttonStyle(OperatorStyle())
                    }
                    HStack{
                        Button("√x") {Radice2()}.buttonStyle(Operator_2_Style())
                        Button("x²") {Potenza2()}.buttonStyle(Operator_2_Style())
                        Button("0") {Numeri += "0";  List += "0"}.buttonStyle(Style0()).padding(.horizontal, 3.5)
                        Button(".") {Virgola()}.buttonStyle(NumberStyle())
                        Button("=") {Calcola()}.buttonStyle(OperatorStyle())
                    }
                }.padding(.all,50).scaleEffect(1.2)
                Text("Storico Risultati:")
                    .padding(.horizontal)
                    .font(.system(size: 17).bold())
                ForEach(List.split(separator: ";"), id: \.self) { lista in VStack{
                    Text("⸰" + lista)
                        .padding(.bottom, 2)
                        .font(.system(size: 17))
                        .textSelection(.enabled)
                    }
                }
            }.padding()
        }
    }
    private func Numeratore_F(){
        if Numeri == "" || Numeri == " "{
            return
        } else {
            Num1 = Double(Numeri) ?? 0
            Numeri += "/"
            List += "/"
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
                if den.indices.contains(1) {
                    Den1 =  Double(den[1]) ?? 1.0
                }
                print(Num1)
            }else {
                Num1 = Double(den[0]) ?? 1; Den1 = 1; print(Num1)
            }
        Numeri = ""
    }
    private func Virgola(){
        if Numeri.contains("."){
            if Numeri.contains(".") {
                Numeri += "."
                List += "."
            }
        } else {
            Numeri += "."
            List += "."
        }
    }
    private func Cancella(){
        if Numeri == "" {
            return
        }
        else {
            List += ";"
        }
        Numeri = ""
        print("*********CANCELLATO********")
    }
    private func TornaIndietro(){
        if Numeri == "" {
            print("Campo vuoto")
        }else{
            Numeri.remove(at: Numeri.index(before: Numeri.endIndex))
            List.remove(at: List.index(before: List.endIndex))
            print("********BACK********")
        }
    }
    private func Potenza2() {
        Denominatore_F()
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        let ris = Frazione.E_XN(f1: f1, nVolte: 2).Semplifica()
        Numeri = "\(ris.Numeratore.Togli0())/\(ris.Denominatore.Togli0())"
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
        Lista += [Numeri]
        List += "x²"
        List += " = \(Numeri);"
        v = true;
    }
    private func Potenza3() {
        Denominatore_F()
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        let ris = Frazione.E_XN(f1: f1, nVolte: 3).Semplifica()
        Numeri = "\(ris.Numeratore.Togli0())/\(ris.Denominatore.Togli0())"
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
        Lista += [Numeri]
        List += "x³"
        List += " = \(Numeri);"
        v = true;
    }
    private func PotenzaY() {
        Denominatore_F()
        opt = "^Y"
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        Numeri = ""
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
        List += "ʸ"
    }
    private func PotenzaE() {
        Denominatore_F()
        opt = "^E"
        Numeri = ""
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
        List += "eˣ"
    }
    private func Radice2() {
        Denominatore_F()
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        let ris = Frazione.Radice2(f1: f1)
        Numeri = "\(ris.Togli0())"
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
        Lista += [Numeri]
        List += "√"
        List += " = \(Numeri);"
        v = true;

    }
    private func Radice3() {
        Denominatore_F()
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        let ris = Frazione.Radice3(f1: f1)
        Numeri = "\(ris.Togli0())"
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
        Lista += [Numeri]
        List += "³√"
        List += " = \(Numeri);"
        v = true;
    }
    private func RadiceY() {
        Denominatore_F()
        opt = "√Y"
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        Numeri = ""
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
        List += "ʸ√"
    }
    private func Moltiplica() {
        Denominatore_F()
        opt = "*"
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        Numeri = ""
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
        List += "*";

    }
    private func Divisione() {
        Denominatore_F()
        opt = "/"
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        Numeri = ""
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
        List += "/"

    }
    private func Addizione() {
        Denominatore_F()
        opt = "+"
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        Numeri = ""
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
        List += "+"

    }
    private func Sottrazione() {
        if (Numeri == ""){
            Denominatore_F()
            opt = "-"
            f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
            Numeri = Numeri + "-"
            List += "-"

        }
        else{
            Denominatore_F()
            opt = "-"
            f1 =  Frazione(Numeratore: Num1, Denominatore: Den1)
            Numeri = ""
            List += "-"
        }
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
    }
    private func PerCento() {
        Denominatore_F()
        opt = "%"
        f1 = Frazione(Numeratore: Num1, Denominatore: Den1)
        Numeri = "\((f1.Numeratore / f1.Denominatore) / 100)"
        print("***\(f1.Numeratore)/\(f1.Denominatore)")
        Lista += [Numeri]
        List += "%"
        List += " = \(Numeri);"
    }
    private func Inverti() {
        if (Numeri.contains("-")){
            Numeri = Numeri.replacingOccurrences(of: "-", with: "")
            List += "(-)"
        }
        else if (Numeri.contains("+")){
            Numeri = Numeri.replacingOccurrences(of: "+", with: "-")
            List += "(-)"
        }
        else {
            Numeri = "-" + Numeri
            List += "(-)"
        }
    }
    
    
    func gcd(a: Int, b: Int) -> Int {
        if (a == 0){
            return b
        }
        else if (b == 0) {
            return a
        }
        if (a < b) {
            return gcd(a: a, b: b % a)
        }
        else {
            return gcd(a: b, b: a % b)
        }
    }
    
    func daDecimaleAFrazione(number: Double) -> Frazione{
        let intVal: Double = floor(number)
        let fVal: Double = number - intVal
        let pVal: Int = 1000000000
        
        let gcdVal = gcd(a: Int((fVal*Double(pVal).rounded())), b: pVal)
        let num: Int = Int((fVal*Double(pVal).rounded())) / gcdVal
        let deno: Int = pVal / gcdVal
        return Frazione(Numeratore: Double(num), Denominatore: Double(deno))
    }
    
    private func Calcola(){
        let Point = Numeri.filter({ $0 == "."}).count
        if Point > 2 {
            return
        } else {
        if Numeri.contains("/") && opt == "" {
            let den = Numeri.split(separator: "/")
            f1 = Frazione(Numeratore: Double(den[0])!, Denominatore: 1)
            Denominatore_F()
            f2 = Frazione(Numeratore: Double(den[1]) ?? 1, Denominatore: 1)
            var risultato: Frazione =  Frazione(Numeratore: 0, Denominatore: 1)
            risultato = Frazione.Divisione(f1: f1, f2: f2)
            risultato = risultato.Semplifica()
            let r1 = risultato.Numeratore
            let r2 = risultato.Denominatore
            if (r2 == 1)
            {
                Numeri = "\(r1.Togli0())";
                List += " = \(r1.Togli0());"

            }
            else
            {
                Numeri = "\(r1.Togli0())/\(r2.Togli0())";
                List += " = \(r1.Togli0())/\(r2.Togli0());"

            }
            v = true
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
                let ris: Double = risultato.Numeratore / risultato.Denominatore
                Numeri = "\(ris.Togli0())"
                List += " = \(Numeri);"
                return;
            case "^E":
                let n1: Double = f2.Numeratore / f2.Denominatore
                let ris1: Double = Frazione.E_E(nVolte: n1)
                Numeri = "\(ris1.Togli0())"
                List += " = \(Numeri);"
                return;
            case "√Y":
                let ris2: Double = Frazione.RadiceY(f1: f1, f2: f2)
                Numeri = "\(ris2.Togli0())"
                List += " = \(Numeri);"
                return;
            default:
                return;
            }
            print("***\(f2.Numeratore)/\(f2.Denominatore)")
            risultato = risultato.Semplifica()
            let r1 = risultato.Numeratore
            let r2 = risultato.Denominatore
            if (r2 == 1)
            { Numeri = "\(r1.Togli0())"; List += " = \(r1.Togli0());"
                
            }
            else{ Numeri = "\(r1.Togli0())/\(r2.Togli0())";
                List += " = \(r1.Togli0())/\(r2.Togli0());" }
            opt = ""
            v = true
        }
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
