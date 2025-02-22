//
//  SubscriptionSheetView.swift
//  TBCMobileBankFeatures
//
//  Created by Data on 21.02.25.
//

import SwiftUI

struct SubscriptionSheetView: View {
    @State private var subscriptionName: String = ""
    @State private var endDate = Date()
    @State private var isActive = false
    @State private var payDay: Int? = nil // Default is nil
    @State private var shouldAddMonth = false  // Flag to control whether to add a month
    
    var viewModel: SubscriptionViewModel
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            VStack {
                Text("ახალი გამოწერის დამატება")
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                Divider()
                
                TextField("გამომწერის სახელი", text: $subscriptionName)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .accentColor(.blue)
                    .cornerRadius(50)
                
                Spacer()
                
                DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                    .padding()
                    .accentColor(.blue)
                    .cornerRadius(50)
                
                Toggle("Add 1 Month to End Date", isOn: $shouldAddMonth)
                    .padding()
                
                Toggle(isOn: $isActive) {
                    Text("Active")
                        .font(.headline)
                }
                .padding()
                
                Button {
                    // Send data only if it's needed
                    viewModel.addSubscription(
                        userId: 2,
                        subscriberName: subscriptionName,
                        subscriberAccount: "1111 2222 3333 4444",
                        payDay: payDay,
                        isSubscribe: true,
                        endDate: endDate,
                        isActive: isActive
                    )
                } label: {
                    Text("დამატება")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 46)
                        .background(Color("mainColor"))
                        .cornerRadius(23)
                }
                .padding([.top, .bottom])
            }
            .padding()
        }
    }
}

//#Preview {
//    SubscriptionSheetView(viewModel: <#SubscriptionViewModel#>)
//}
