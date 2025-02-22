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
    
    var recipientName: String?
}

let sampleItems: [Item] = [
    Item(
        image: "house.fill",
        title: "Spotify Subscription",
        subtitle: "Premium Monthly",
        price: "10$",
        date: Date(),
        recipientName: "Spotify"
    ),
    Item(
        image: "ellipsis",
        title: "Netflix Subscription",
        subtitle: "Premium Yearly",
        price: "120$",
        date: Date().addingTimeInterval(-172800),
        recipientName: "Spotify"
    ),
    Item(
        image: "gamecontroller.fill",
        title: "Disney+ Subscription",
        subtitle: "Standard Monthly",
        price: "8$",
        date: Date().addingTimeInterval(-345600),
        recipientName: "Spotify"
    ),
    Item(
        image: "apple.logo",
        title: "Apple Music Subscription",
        subtitle: "Family Plan Monthly",
        price: "15$",
        date: Date().addingTimeInterval(-86400),
        recipientName: "Spotify"
    ),
    Item(
        image: "tv.fill",
        title: "HBO Max Subscription",
        subtitle: "Standard Monthly",
        price: "14$",
        date: Date().addingTimeInterval(-604800),
        recipientName: "Spotify"
    )
]




//struct Item {
//    var image: String
//    var title: String
//    var subtitle: String
//    var price: String
//    var date: Date
//    var recipientName: String?  // The name of the recipient
//    var recipientAccountNumber: String?  // The recipient's account number
//    var recipientBankName: String?  // The recipient's bank name
//    var recipientBankCode: String?  // The recipient's bank code
//    var senderName: String?  // The name of the sender
//    var senderAccountNumber: String?  // The sender's account number
//    var senderBankName: String?  // The sender's bank name
//    var senderBankCode: String?  // The sender's bank code
//}
//
//let sampleItems: [Item] = [
//    Item(
//        image: "house.fill",
//        title: "Spotify Subscription",
//        subtitle: "Premium Monthly",
//        price: "10$",
//        date: Date()
////        recipientName: "Spotify",
////        recipientAccountNumber: "123456789",
////        recipientBankName: "Swedbank",
////        recipientBankCode: "SWEDSESS",
////        senderName: "John Doe",
////        senderAccountNumber: "987654321",
////        senderBankName: "Nordea",
////        senderBankCode: "NDEASESS"
//    ),
//    Item(
//        image: "ellipsis",
//        title: "Netflix Subscription",
//        subtitle: "Premium Yearly",
//        price: "120$",
//        date: Date().addingTimeInterval(-172800)
////        recipientName: "Netflix",
////        recipientAccountNumber: "246810121",
////        recipientBankName: "HSBC",
////        recipientBankCode: "HSBCGB2L",
////        senderName: "Alice Smith",
////        senderAccountNumber: "135792468",
////        senderBankName: "Barclays",
////        senderBankCode: "BARCGB22"
//    ),
//    Item(
//        image: "gamecontroller.fill",
//        title: "Disney+ Subscription",
//        subtitle: "Standard Monthly",
//        price: "8$",
//        date: Date().addingTimeInterval(-345600)
////        recipientName: "Disney+",
////        recipientAccountNumber: "1122334455",
////        recipientBankName: "Chase Bank",
////        recipientBankCode: "CHASUS33",
////        senderName: "David Miller",
////        senderAccountNumber: "9988776655",
////        senderBankName: "Wells Fargo",
////        senderBankCode: "WFBIUS6S"
//    ),
//    Item(
//        image: "apple.logo",
//        title: "Apple Music Subscription",
//        subtitle: "Family Plan Monthly",
//        price: "15$",
//        date: Date().addingTimeInterval(-86400)
////        recipientName: "Apple",
////        recipientAccountNumber: "9988776655",
////        recipientBankName: "Bank of America",
////        recipientBankCode: "BOFAUS3N",
////        senderName: "Emma Green",
////        senderAccountNumber: "12344321",
////        senderBankName: "Citibank",
////        senderBankCode: "CITIUS33"
//    ),
//    Item(
//        image: "tv.fill",
//        title: "HBO Max Subscription",
//        subtitle: "Standard Monthly",
//        price: "14$",
//        date: Date().addingTimeInterval(-604800)
////        recipientName: "HBO Max",
////        recipientAccountNumber: "2233445566",
////        recipientBankName: "Goldman Sachs",
////        recipientBankCode: "GSUS33N",
////        senderName: "Sophia Brown",
////        senderAccountNumber: "6655443322",
////        senderBankName: "Deutsche Bank",
////        senderBankCode: "DEUTDEFF"
//    )
//]
