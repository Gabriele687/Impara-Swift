//
//  ContentView.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//
import SwiftUI
struct ContentView: View {
    var body: some View {
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

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
