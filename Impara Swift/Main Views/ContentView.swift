//
//  ContentView.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//
import SwiftUI
struct ContentView: View {
    var animation: Animation {Animation.easeOut}
    @State private var isRotated = false
    @State var hide = false
    @State var scale1 = 0.0000001
    var body: some View {
        ZStack {
            Image("LaunchScreenImage")
                .onAppear() {
                self.isRotated.toggle()
                    sleep(1)
                    print("OK")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        hide = true
                    }
                }
            .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
            .scaleEffect(isRotated ? 80 : 1)
            .animation(animation)
            
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
