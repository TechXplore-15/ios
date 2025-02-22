//
//  Model.swift
//  TBCMobileBankFeatures
//
//  Created by Data on 21.02.25.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let subtitle: String
    let price: String
    
    var date: Date
}

let sampleItems: [Item] = [
    Item(
        image: "house.fill",
        title: "Modern House",
        subtitle: "Beautiful family home",
        price: "250$",
        date: Date()
    ),
    Item(
        image: "ellipsis",
        title: "POS - saba.com.g",
        subtitle: "სხვადასხვა ხარჯი",
        price: "90$",
        date: Date().addingTimeInterval(-172800)
    ),
    Item(
        image: "gamecontroller.fill",
        title: "MacBook Pro",
        subtitle: "16-inch, M3 chip",
        price: "25$",
        date: Date().addingTimeInterval(-172800)
    )
]
