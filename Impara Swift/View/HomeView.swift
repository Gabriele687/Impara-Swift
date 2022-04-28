//
//  HomeView.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var queryString = ""
    let indexs = ["", "Multipli", "Che tipo di Eq. 2°", "Anno Bisestile", "Figure", "Text File", "Calc. Frazioni", "Riempi", "Trova Numero", "Password Generator"]
    var body: some View {
        ScrollView{
            ForEach(searchResults, id: \.self) { name in
                let i = indexs.firstIndex(where: {$0 == "\(name)"})
                self.buildView(for: i!)
            }.searchable(text: $queryString)
        }
    }
    var searchResults: [String] {
            if queryString.isEmpty {
                return indexs.reversed()
            } else {
                return indexs.reversed().filter { $0.contains(queryString) }
            }
        }
    func buildView(for id: Int) -> some View {
            Group {
                if id == 1 {
                    HomeEs(text: "Multipli", imageName: "Esercizio1", nextView: Es1())
                }
                else if id == 2 {
                    HomeEs(text: "Che tipo di Eq. 2°", imageName: "Esercizio2", nextView: Es2())
                }
                else if id == 3 {
                    HomeEs(text: "Anno Bisestile", imageName: "Esercizio3", nextView: Es3())
                }
                else if id == 4 {
                    HomeEs(text: "Figure", imageName: "Esercizio4", nextView: Es4())
                }
                else if id == 5 {
                    HomeEs(text: "Text File", imageName: "Esercizio5", nextView: Es5())
                }
                else if id == 6 {
                    HomeEs(text: "Calc. Frazioni", imageName: "Esercizio6", nextView: Es6())
                }
                else if id == 7 {
                    HomeEs(text: "Riempi", imageName: "Esercizio7", nextView: Es7())
                }
                else if id == 8 {
                    HomeEs(text: "Trova Numero", imageName: "Esercizio8", nextView: Es8())
                }
                else if id == 9 {
                    HomeEs(text: "Password Generator", imageName: "Esercizio9", nextView: Es9())
                }
            }
        }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
