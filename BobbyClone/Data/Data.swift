//
//  Data.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 10/12/2021.
//

import Foundation

let templates = [
    SubscriptionTemplate(name: "Apple Music", iconString: "applelogo", colorHexa: "#000000", isPopular: true),
    SubscriptionTemplate(name: "Dropbox", iconString: "icloud.fill", colorHexa: "#006EFF", isPopular: false),
    SubscriptionTemplate(name: "iCloud", iconString: "icloud.fill", colorHexa: "#00A1FF", isPopular: false),
    SubscriptionTemplate(name: "Notion", iconString: "questionmark.square", colorHexa: "#B0B0B0", isPopular: false),
    SubscriptionTemplate(name: "Spotify", iconString: "wave.3.forward", colorHexa: "#00DF64", isPopular: true),
    SubscriptionTemplate(name: "Deezer", iconString: "chart.bar.fill", colorHexa: "#B0B0B0", isPopular: false),
    SubscriptionTemplate(name: "Netflix", iconString: "n.circle", colorHexa: "#FF3535", isPopular: true),
    SubscriptionTemplate(name: "Firebase", iconString: "flame.fill", colorHexa: "#FFC100", isPopular: false),
    SubscriptionTemplate(name: "Twitch", iconString: "message.fill", colorHexa: "#7900FF", isPopular: false),
    SubscriptionTemplate(name: "Telenet", iconString: "face.smiling.fill", colorHexa: "#FFE700", isPopular: false),
    SubscriptionTemplate(name: "Google Drive", iconString: "icloud.fill", colorHexa: "#FFFFFF", isPopular: true)
]

let januraryFirst2020 = Date(timeIntervalSince1970: 1577860560)
let december8Of2021 = Date(timeIntervalSince1970: 1638939600)

let fakeSubscriptions = [
    Subscription(name: "PS+", price: 50, iconString: "plus", colorHexa: "#00A1FF", firstBilling: januraryFirst2020, billingCycleNumber: 1, billingCycleTimeUnit: .year),
    Subscription(name: "Notion", price: 4, iconString: "questionmark.square", colorHexa: "#B0B0B0", firstBilling: december8Of2021, billingCycleNumber: 1, billingCycleTimeUnit: .month)
]
