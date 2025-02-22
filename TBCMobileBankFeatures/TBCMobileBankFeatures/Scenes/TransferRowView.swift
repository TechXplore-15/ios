//
//  TransferRowView.swift
//  TBCMobileBankFeatures
//
//  Created by Data on 21.02.25.
//

import SwiftUI

struct TransferRowView: View {
    let item: Item
    
    var body: some View {
        HStack {
            IconView(imageName: item.image)
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            PriceView(price: item.price)
        }
        .padding(5)
    }
}

struct IconView: View {
    let imageName: String
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 45, height: 45)
                .foregroundStyle(Color.gray.opacity(0.25))
            if imageName == "gamecontroller.fill" {
                Image(systemName: imageName)
                    .resizable()
                    .foregroundStyle(.main)
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            } else if imageName == "house.fill" {
                Image(systemName: imageName)
                    .resizable()
                    .foregroundStyle(.another)
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            } else if imageName == "ellipsis" {
                Image(systemName: imageName)
                    .resizable()
                    .foregroundStyle(.ellipsis)
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
        }
        .padding(.trailing, 10)
    }
}

struct PriceView: View {
    let price: String
    
    var body: some View {
        Text("-\(price)")
            .font(.title3)
            .foregroundColor(.primary)
            .bold()
    }
}

#Preview {
    TransferRowView(item: Item(image: "house.fill", title: "Modern House", subtitle: "Beautiful family home", price: "250$", date: Date()))
}
