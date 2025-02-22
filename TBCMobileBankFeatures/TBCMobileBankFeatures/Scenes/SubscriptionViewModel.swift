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
        guard let url = URL(string: "https://api.dev.x.devops-ninja.me/Card/?user_id=\(userId)") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
                if httpResponse.statusCode != 200 {
                    print("API Request failed with status code: \(httpResponse.statusCode)")
                    return
                }
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let jsonString = String(data: data, encoding: .utf8)
                print("Raw JSON Response: \(jsonString ?? "Invalid JSON")") // Debugging
                
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
            "end_date": formatDateToString(date: endDate), // Convert Date to String
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
        formatter.dateFormat = "yyyy-MM-dd" // Formatting the date to match the API requirement
        return formatter.string(from: date)
    }
    
//    func deleteSubscription(_ subscription: CardSubscription) {
//        guard let url = URL(string: "https://api.dev.x.devops-ninja.me/Card/\(subscription.id)") else {
//            print("Invalid URL")
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "DELETE"  // HTTP DELETE method
//        
//        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
//            if let error = error {
//                print("Error deleting subscription: \(error.localizedDescription)")
//                return
//            }
//            
//            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
//                DispatchQueue.main.async {
//                    // Update your subscriptions array to reflect the deletion
//                    if let index = self?.subscriptions.firstIndex(where: { $0.id == subscription.id }) {
//                        self?.subscriptions.remove(at: index)
//                    }
//                }
//            } else {
//                print("Failed to delete subscription")
//            }
//        }.resume()
//    }
}
