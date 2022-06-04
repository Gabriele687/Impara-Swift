//
//  ContentView.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//
import SwiftUI
struct ContentView: View {
    var animation: Animation {Animation.easeIn(duration: 1)}
    @State private var isRotated = false
    @State private var isRotated1 = false
    @State var hide = false
    let EnterImpact = UIImpactFeedbackGenerator(style: .rigid)
    var body: some View {
        ZStack {
            Image("LaunchScreenImage-2")
                .onAppear() {
                    sleep(1)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.isRotated.toggle()
                        EnterImpact.prepare()
                        EnterImpact.impactOccurred()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                        hide = true
                    }
                }
                .scaleEffect(isRotated ? 80 : 1)
                .animation(animation)
            Color.red.blendMode(.screen)
            
            if hide  {
                TabView (selection: .constant(1)){
                    NavigationView {InfoView().navigationTitle("Info App")}
                        .tabItem { Text("Info sull'app"); Label("Info", systemImage: "info.circle.fill");
                        }.tag(2)
                    NavigationView {HomeView().navigationTitle("Impara Swift")}
                    .tabItem { Text("Home"); Label("Home", systemImage: "house.fill");} .tag(1)
                    NavigationView {ChiSiamoView().navigationTitle("Chi Sono")}
                        .tabItem { Text("Chi siamo"); Label("Chi sono", systemImage: "person.circle.fill")}.tag(3)
                }
            }
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
