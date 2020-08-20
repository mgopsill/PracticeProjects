//
//  BookCard.swift
//  BookClub
//
//  Created by Mike Gopsill on 22/07/2020.
//

import SwiftUI

struct BookCard: View {
    let book: Book
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "book.fill")
                .frame(minWidth: 65, minHeight: 90)
                .background(Color.yellow)
                .padding([.top, .bottom], 4)
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(Font.system(size: 16).bold())
                Text(book.author)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            RingProgressView(progress: book.history.last?.progress ?? 0.0)
                .frame(maxWidth: 70, maxHeight: 70)
        }
        .frame(maxHeight: 120)
    }
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        BookCard(book: Book.fake)
    }
}
