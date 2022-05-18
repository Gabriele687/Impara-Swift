//
//  Funzioni Condivise.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

import SwiftUI
struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 100, height: 6, alignment: .center)
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(16)
            .scaleEffect(configuration.isPressed ? 1.0 : 1.2)
            .font(.system(size: 14).bold())
    }
}

extension Double {
    func Togli0() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}

extension View {
  func hapticFeedbackOnTap(style: UIImpactFeedbackGenerator.FeedbackStyle = .light) -> some View {
    self.onTapGesture {
      let impact = UIImpactFeedbackGenerator(style: style)
      impact.impactOccurred()
    }
  }
}

func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
}

struct HomeEs<TargetView: View>: View {
    var text: String
    var imageName: String
    var nextView: TargetView
    var body: some View {
        NavigationLink(destination: nextView.navigationTitle(text).navigationBarTitleDisplayMode(.inline)){
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            HStack {
                VStack(alignment: .leading) {
                    HStack{Image(systemName: "swift");Text("Swift")}
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(text)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text("Gabriele Gervasoni".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 0.5)).padding(.horizontal,10)
    }
}
extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
