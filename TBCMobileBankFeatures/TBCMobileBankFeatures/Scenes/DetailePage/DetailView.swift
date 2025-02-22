//
//  DetailView.swift
//  TBCMobileBankFeatures
//
//  Created by Data on 21.02.25.
//

import SwiftUI

struct DetailView: View {
    @State private var showSheet = false
    let item: Item
    @StateObject private var viewModel = SubscriptionViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(item.date, style: .date)
                    .font(.system(size: 14))
                    .padding([.leading, .top])

                Text(item.title)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.leading)
                
                HStack {
                    Text("-\(item.price)")
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                }
                
                Divider()
                HStack {
                    IconView(imageName: item.image)
                    
                    Text(item.subtitle)
                        .font(.title3)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.leading)
                
                Divider()
                
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            Button(action: {
                                showSheet.toggle()
                            }) {
                                AddSubscriptionButtonStyle()
                            }
                            
                            ForEach(1..<6) { _ in
                                DummyButtonStyle()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding([.bottom, .top])
                .sheet(isPresented: $showSheet) {
                    SubscriptionSheetView(viewModel: viewModel)
                        .presentationDetents([.fraction(0.55)])
                }
                
                Divider()
                
                ReceiverView(title: "მიმღები")
                
                Divider()
                
                ReceiverView(title: "გამგზავნი")
                
                Spacer()
            }
        }
        .navigationTitle("დეტალები")
        .background(Color("backgroundColor"))
    }
}

#Preview {
    DetailView(item: Item(image: "gamecontroller.fill", title: "MacBook Pro", subtitle: "16-inch, M3 chip", price: "25$", date: Date().addingTimeInterval(-172800)))
}
