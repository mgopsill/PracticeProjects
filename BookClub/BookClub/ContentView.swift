//
//  ContentView.swift
//  BookClub
//
//  Created by Mike Gopsill on 22/07/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var bookStore: BookStore = BookStore()
    var body: some View {
        NavigationView {
            List {
                ForEach(bookStore.books.indexed(), id: \.1.id) { index, book in
                    NavigationLink(destination: BookView(book: self.$bookStore.books[index])) {
                        BookCard(book: book)
                    }
                }
            }
            .navigationBarTitle("Currently Reading")
        }
    }
}

final class BookStore: ObservableObject {
    @Published var books: [Book] = Book.fakes
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Sequence {
    func indexed() -> Array<(offset: Int, element: Element)> {
        return Array(enumerated())
    }
}
