//
//  Funzione.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

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
