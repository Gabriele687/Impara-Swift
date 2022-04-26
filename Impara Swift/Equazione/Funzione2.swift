//
//  Funzioneù.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

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
