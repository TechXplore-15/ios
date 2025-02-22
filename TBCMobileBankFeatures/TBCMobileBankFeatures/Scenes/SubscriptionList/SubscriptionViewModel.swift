//
//  SubscriptionViewModel.swift
//  TBCMobileBankFeatures
//
//  Created by Data on 22.02.25.
//

import Foundation

class SubscriptionViewModel: ObservableObject {
    @Published var subscriptions: [CardSubscription] = []

    func fetchSubscriptions(userId: Int) {
        guard let url = URL(string: "https://api.dev.x.devops-ninja.me/Card/?user=\(userId)") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    return
                }
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                _ = String(data: data, encoding: .utf8)

                let decodedData = try JSONDecoder().decode([CardSubscription].self, from: data)
                DispatchQueue.main.async {
                    self.subscriptions = decodedData
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    
    
    func addSubscription(userId: Int, subscriberName: String, subscriberAccount: String, payDay: Int?, isSubscribe: Bool, endDate: Date, isActive: Bool) {
        let url = URL(string: "https://api.dev.x.devops-ninja.me/Card/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "user": userId,
            "subscriber_name": subscriberName,
            "subscriber_account": subscriberAccount,
            "pay_day": payDay ?? NSNull(),
            "is_subscribe": isSubscribe,
            "end_date": formatDateToString(date: endDate),
            "is_active": isActive
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: body)
            request.httpBody = data
        } catch {
            print("Error encoding data: \(error)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            if let data = data {
                print("Response: \(String(data: data, encoding: .utf8) ?? "")")
            }
        }.resume()
    }

    func formatDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}
