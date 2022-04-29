//
//  ChiSiamoView.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//


import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
struct ChiSiamoView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 45.8813228, longitude: 10.1773941), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    let places = [ Place(name: "Olivelli Putelli", latitude: 45.8813228, longitude: 10.1773941)]
    @State var name: String = ""
    var body: some View {
        ScrollView{
        VStack (alignment: .leading){
            HStack {
        Image(systemName: "person.circle.fill")
            Text("Gabriele Gervasoni").bold()
        }.padding()
        HStack {
            Image(systemName: "mail.fill").foregroundColor(.blue)
            Text("Mail: gabrielegervasoni04@icloud.com")
        }.padding().frame(alignment: .leading)
            HStack {
                Image(systemName: "graduationcap.fill").foregroundColor(.brown)
                Text("School: ");Link("Olivelli Putelli",
                                      destination: URL(string: "https://www.olivelliputelli.edu.it")!)
            }.padding().frame(alignment: .leading)
            HStack {
            Map(coordinateRegion: $region, annotationItems: places) { place in
                MapMarker(coordinate: place.coordinate)
                    }
            }
            .frame(height: 200).padding()
            HStack {
                Image(systemName: "mappin.circle.fill").foregroundColor(.red).background(Color.white)
                Text("Via Ubertosa 1 Darfo Corna (25047) Bs.")
        }.padding()
        }
        }
    }
}

struct ChiSiamoView_Previews: PreviewProvider {
    static var previews: some View {
        ChiSiamoView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
