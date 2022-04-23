//
//  Calc_Button_Style.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 01/03/22.
//

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
