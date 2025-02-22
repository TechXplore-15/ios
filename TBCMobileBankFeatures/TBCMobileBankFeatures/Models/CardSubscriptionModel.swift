//
//  CardSubscriptionModel.swift
//  TBCMobileBankFeatures
//
//  Created by Data on 22.02.25.
//

import Foundation

struct CardSubscription: Codable, Identifiable {
    let id: Int
    let userId: Int
    let subscriberName: String
    let subscriberAccount: String
    let payDay: Int?
    let isSubscribe: Bool?
    let endDate: String
    let isActive: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case subscriberName = "subscriber_name"
        case subscriberAccount = "subscriber_account"
        case payDay = "pay_day"
        case isSubscribe = "is_subscribe"
        case endDate = "end_date"
        case isActive = "is_active"
    }
}

