//
//  Es5().swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

import SwiftUI
import UniformTypeIdentifiers


struct Es5: View {
    @State private var button = true
    @State private var descrizione = #"""

import SwiftUI
import SwiftUILib_DocumentPicker

struct Exe5: View {
    @State private var showingAlert = false
    @State var showDocPicker = false
    @State var readString = ""
    @State var autoName = "Nome automatico"
    @State var writeString = "Inserisci qua il testo !!!"
    @State var url: URL =  URL(string: "Url")!
    var body: some View {
        ScrollView{
            VStack {
                Text("Prova Codice").font(.title.bold()).padding(.bottom)

                Text("Solo file di testo semplici (es. .txt, .rtf)\nIl file deve essere nella cartella Impara Swift!!!").font(.system(size: 13.0))
                VStack{
                Button("Scegli File") {
                    self.showDocPicker.toggle()
                    }.documentPicker(
                      isPresented: $showDocPicker,
                      documentTypes: ["public.text"], onDocumentsPicked:  { urls in
                          var nome2 =  urls.description
                          var nome1 = nome2.split(separator: "/").last
                          var nome = nome1?.replacingOccurrences(of: "]", with: "")
                          url = urls.first!
                          let fileName = nome!
                          let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                          let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
                          do {
                              var test = try String(contentsOf: url)
                              readString = test
                              writeString = test
                          } catch let error as NSError {
                              print("Failed to read")
                              print(error)
                          }
                          do{
                              try writeString.write(to: url, atomically: true, encoding: String.Encoding.utf8)
                          } catch let error as NSError {
                              print("Failed to write")
                              print(error)
                          }
                          print("***\(readString)")
                          print(nome)
                          print("Selected folder: \(urls.first!)")
                      })
                        .buttonStyle(.borderedProminent).frame(width: 145, alignment: .center)
                    
                }
                HStack{
                    Image(systemName: "text.alignleft")
                Text("Inserisci il testo da Sostituire:").bold()
                }.padding(.top)
                HStack{
                TextEditor(text: $writeString)
                    .frame(maxHeight: 400, alignment: .top)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                            .onSubmit {
                                do{
                                    try writeString.write(to: url, atomically: true, encoding: String.Encoding.utf8)
                                } catch let error as NSError {
                                    print("Failed to write")
                                    print(error)
                                }
                                do {
                                    readString = try String(contentsOf: url)
                                } catch let error as NSError {
                                    print("Failed to read")
                                    print(error)
                                }
                    }
                Button(action: actionSheet) {
                Image(systemName: "square.and.arrow.up")
                }.hapticFeedbackOnTap()
                }
                Text("Nota: Basta schiacciare al di fuori della casella di testo e tutto si salva automaticamente!!!").font(.system(size: 13.0)).padding().foregroundColor(.gray)
            } .onTapGesture {TextUpdate()}
        }.padding() .onTapGesture {TextUpdate()}
    }
    func actionSheet() {
        let TextoCompartido = "\(writeString)"
        let AV = UIActivityViewController(activityItems: [TextoCompartido], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(AV, animated: true, completion: nil)
    }
    func TextUpdate(){
        do{
        try writeString.write(to: url, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed to write")
        print(error)
    }
        do {
            let test = try String(contentsOf: url)
            readString = test
            writeString = test
        } catch let error as NSError {
            print("Failed to read")
            print(error)
        }
            hideKeyboard()
    }
}
struct Exe5_Previews: PreviewProvider {
    static var previews: some View {
        Exe5()
    }
}


"""#
    var body: some View {
        ScrollView{
        VStack(){
            Text("Codice:")
                .font(.system(size: 15).bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
           
            ScrollView{
                Text(descrizione)
                            .contextMenu {Button(action: {UIPasteboard.general.string = descrizione}) {Text("Copia")}}
                .font(.system(size: 11.0))
                    
            }.onTapGesture {
                hideKeyboard()
            }
            .padding(.horizontal)
            .frame(height: 350, alignment: .top)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1)).padding(.horizontal,10)

            
            Text("Descrizione:")
                .textSelection(.enabled)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .font(.system(size: 17).bold())
            Text("Esercizio Text File: in questo esercizio più impegnativo trovi come inserire file gestire url usare il documentPicker , leggere e scrivere su file di testo. Troverai varie funzioni ma prima di creare l'esercizio aggiungi alle dipendenze del tuo testo questo package: https://github.com/swiftuilib/document-picker Tutto qua ora divertiti!!! ").font(.caption).padding(.horizontal)
            
            Button(action: { }) {
                NavigationLink(destination: Exe5().navigationTitle("Text FIle")){Text("Prova il codice")}
            }.buttonStyle(GradientButtonStyle()).padding(.top)
            Spacer()
            }
        }
    }
}

struct Es5_Previews: PreviewProvider {
    static var previews: some View {
        Es5()
    }
}

