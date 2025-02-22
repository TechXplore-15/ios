//
//  SubscriptionList.swift
//  TBCMobileBankFeatures
//
//  Created by Data on 21.02.25.
//

import SwiftUI

struct SubscriptionList: View {
    @StateObject private var viewModel = SubscriptionViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.subscriptions, id: \.id) { subscription in
                VStack(alignment: .leading) {
                    Text(subscription.subscriberName)
                        .font(.headline)
                    Text("Account: \(subscription.subscriberAccount)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("End Date: \(subscription.endDate)")
                        .font(.subheadline)
                    Text(subscription.isActive ? "Active" : "Inactive")
                        .font(.subheadline)
                        .foregroundColor(subscription.isActive ? .green : .red)
                    
                    if let payDay = subscription.payDay {
                        Text("Pay Day: \(payDay)")
                            .font(.subheadline)
                    }
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .padding(5)
            }
            .listStyle(.inset)
            .scrollContentBackground(.hidden)
            .background(Color("backgroundColor"))
            .navigationTitle("გამოწერილები")
            .onAppear {
                viewModel.fetchSubscriptions(userId: 2)
            }
        }
    }
}

#Preview {
    SubscriptionList()
}
