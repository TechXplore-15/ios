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
                        .presentationDetents([.fraction(0.80)])
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

struct AddSubscriptionButtonStyle: View {
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.gray)
                Image(systemName: "dollarsign.arrow.circlepath")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 25, height: 25)
            }
            
            Text("დამატება")
                .font(.system(size: 14))
                .foregroundColor(.primary)
                .cornerRadius(10)
        }
    }
}

struct DummyButtonStyle: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.gray)
                
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 25, height: 25)
            }
            
            Text("უფუნქციო")
                .font(.system(size: 14))
                .foregroundColor(.primary)
        }
        .opacity(0.3)
    }
}

struct ReceiverView: View {
    var title: String
//    let item: Item
    var body: some View {
        Text(title)
            .padding()
            .bold()
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .padding([.leading])
                Spacer()
                Text("მიმღების რაღაცა აღწერა")
                    .font(.system(size: 14, weight: .bold))
                    .padding([.trailing])
            }
            
            HStack {
                Text("ანგარიშის ნომერი")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .padding([.top, .leading])
                
                Spacer()
                
                Text("GE66TB0002511340000000")
                    .font(.system(size: 14, weight: .bold))
                    .padding([.trailing])
            }
            
            HStack {
                Text("ბანკის სახელი")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .padding([.top, .leading])
                
                Spacer()
                
                Text("სს თიბისი ბანკი")
                    .font(.system(size: 14, weight: .bold))
                    .padding([.trailing])
            }
            
            HStack {
                Text("ბანკის კოდი")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .padding([.top, .leading])
                
                Spacer()
                
                Text("TBCBGE22")
                    .font(.system(size: 14, weight: .bold))
                    .padding([.trailing])
            }
        }
    }
}

#Preview {
    DetailView(item: Item(image: "gamecontroller.fill", title: "MacBook Pro", subtitle: "16-inch, M3 chip", price: "25$", date: Date().addingTimeInterval(-172800)))
}
