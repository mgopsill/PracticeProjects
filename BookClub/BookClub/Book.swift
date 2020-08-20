//
//  Book.swift
//  BookClub
//
//  Created by Mike Gopsill on 22/07/2020.
//

import Foundation

struct Book: Identifiable {
    let id = UUID()
    let coverName: String
    let title: String
    let author: String
    var history: [BookHistory]
}

struct BookHistory: Identifiable {
    let id = UUID()
    let progress: Double
    let note: String
    let timeStamp: Date
}

extension Book {
    static var fake: Book {
        Book(coverName: "ready player one",
             title: "Ready Player One",
             author: "Ernest Cline",
             history: [])
    }
    
    static var fakes: [Book] {
        [Book(coverName: "ready player one",
              title: "Ready Player One",
              author: "Ernest Cline",
              history: []),
         Book(coverName: "Oathbringer",
               title: "Oathbringer",
               author: "Brandon Sanderson",
               history: []),
         Book(coverName: "Words of Radiance",
               title: "Words of Radiance",
               author: "Brandon Sanderson",
               history: []),
         Book(coverName: "Meditations",
               title: "Meditations",
               author: "Marcus Aurelius",
               history: []),
         Book(coverName: "Name of the Wind",
               title: "Name of the Wind",
               author: "Patrick Rothfuss",
               history: []),
         Book(coverName: "The Wise Man's Fear",
               title: "The Wise Man's Fear",
               author: "Patrick Rothfuss",
               history: []),
         Book(coverName: "Ender's Game",
               title: "Ender's Game",
               author: "Orson Scott Card",
               history: []),
        ]
    }
}
