//
//  File.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 28/02/22.
//

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
        var x: [Double] = [0,0]
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
            i = i+1
            let mod = i.truncatingRemainder(dividingBy: n1)
            let mod2 = i.truncatingRemainder(dividingBy: n2)
            if mod == 0 && mod2 == 0 {
                return i;
            }
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
