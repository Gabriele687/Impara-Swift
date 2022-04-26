//
//  Funzione.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

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
