//
//  BookView.swift
//  BookClub
//
//  Created by Mike Gopsill on 22/07/2020.
//

import SwiftUI

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

struct EditorConfig {
    var isEditorPresented: Bool
    var note: String
    var progress: Double
    
    mutating func present(initialProgress: Double) {
        progress = initialProgress
        note = ""
        isEditorPresented = true
    }
}

struct BookView: View {
    @Binding var book: Book
    @State private var editorConfig: EditorConfig
    
    init(book: Binding<Book>) {
        _book = book
        let latestHistory = book.wrappedValue.history.last
        _editorConfig = State(wrappedValue: EditorConfig(isEditorPresented: false,
                                                         note: latestHistory?.note ?? "",
                                                         progress: latestHistory?.progress ?? 0.0))
    }
    
    func presentEditor() {
        editorConfig.present(initialProgress: editorConfig.progress)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            List {
                BookCard(book: book)
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            presentEditor()
                        }
                    }, label: {
                        Label("Update Progress", systemImage: "largecircle.fill.circle")
                            .foregroundColor(.blue)
                            .font(Font.system(size: 13))
                    })
                    Spacer()
                }
                HStack {
                    
                    Text("\(String(format: "%.2f", book.history.last?.progress ?? 0.0))%")
                    Spacer()
                    Text("June 22, 2020 at 9:41AM")
                }
                .font(Font.system(size: 14))
                
                if !book.history.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(book.history.reversed()) { history in
                            HStack {
                                Text(history.timeStamp, style: .date)
                                Text("\(history.note)")
                                Text("\(String(format: "%.2f", history.progress))%")
                            }
                            .font(Font.system(size: 10))
                            .foregroundColor(.gray)
                        }
                    }.transition(.move(edge: .top))
                }
            }
            .zIndex(0)

            
            if editorConfig.isEditorPresented {
                ProgressEditor(editorConfig: $editorConfig, saveHistory: { history in
                    book.history.append(history)
                })
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                    .padding([.leading, .trailing], 10)
                    .offset(x: 0, y: 30)
                    .zIndex(1)
                    .transition(.move(edge: .bottom))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: .constant(Book.fake))
    }
}
