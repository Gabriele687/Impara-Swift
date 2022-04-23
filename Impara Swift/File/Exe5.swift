//
//  Exe5.swift
//  Impara Swift
//
//  Created by Gabriele Gervasoni on 18/02/22.
//

import SwiftUI
import SwiftUILib_DocumentPicker

struct Exe5: View {
    @State private var showingAlert = false
    @State var showDocPicker = false
    @State var readString = ""
    @State var autoName = "Nome automatico"
    @State var writeString = "Inserisci qua il testo !!!"
    @State var url: URL =  URL(string: "Url")!
    @FocusState var isInputActive: Bool
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
                          let nome2 =  urls.description
                          let nome1 = nome2.split(separator: "/").last
                          let nome = nome1?.replacingOccurrences(of: "]", with: "")
                          url = urls.first!
                          let fileName = nome!
                          let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                          _ = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
                          do {
                              let test = try String(contentsOf: url)
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
                          print(nome as Any)
                          print("Selected folder: \(urls.first!)")
                      })
                        .buttonStyle(.borderedProminent).frame(width: 145, alignment: .center)
                }
                HStack{
                    Image(systemName: "text.alignleft")
                Text("Ecco il tuo testo ora modificalo!!!").bold()
                    Button(action: actionSheet) {
                    Image(systemName: "square.and.arrow.up")
                    }.hapticFeedbackOnTap()
                }.padding(.top)
                HStack{
                TextEditor(text: $writeString)
                        .onTapGesture {TextUpdate()}
                        .padding()
                        .frame(maxHeight: 400, alignment: .top)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1).padding(.horizontal))
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
                                .toolbar {
                                    ToolbarItemGroup(placement: .keyboard) {
                                        Spacer()
                                        Button("Done") {
                                        isInputActive = false
                                            hideKeyboard()
                                            TextUpdate()
                                                        }
                                                    }
                                                }
                            }
                Text("Nota: Basta schiacciare al di fuori della casella di testo e tutto si salva automaticamente!!!").font(.system(size: 13.0)).padding().foregroundColor(.gray)
            }
        }.padding() .onTapGesture {hideKeyboard(); TextUpdate()}
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
    }
}
struct Exe5_Previews: PreviewProvider {
    static var previews: some View {
        Exe5()
    }
}
