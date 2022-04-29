//
//  InfoView.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ScrollView{
        VStack (alignment: .leading){
            HStack {
        Image(systemName: "person.circle.fill")
            Text("Gabriele Gervasoni").bold()
        }.padding()
        HStack {
            Image(systemName: "info.circle.fill").foregroundColor(.blue)
            Text("Quest' app ti permette di avere codice e usarlo liberamente per i tuoi progetti; grazie ad esso tu puoi imparare varie funzionalità e caratteritische del linguaggio di programmazione Swift.")
        }.padding().frame(alignment: .leading)
            HStack {
                Image(systemName: "exclamationmark.circle.fill").foregroundColor(.red)
                Text("Ricorda quando crei un nuovo progetto come interfaccia grafica seleziona SwiftUl e non Storyboard.")
            }.padding().frame(alignment: .leading)
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
