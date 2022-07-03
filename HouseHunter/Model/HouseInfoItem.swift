//
//  HouseInfoItem.swift
//  HouseHunter
//
//  Created by Thet Htun on 12/19/21.
//

import Foundation
import UIKit

class HouseInfoItem {
    
    let id: String
    let housingType: String
    var isFavorite: Bool = false
    let pricePerMonth: String
    let purchasePrice: String
    let bedroomCountDesc: String
    let ownerCountDescription: String
    let depreciationPerYear: String
    let houseLocationDescription: String
    let houseImageUrl: String
    
    var monthlyPaymentAttributedString: NSAttributedString {
        buildMonthlyPriceAttributedString(price: pricePerMonth)
    }
    
    internal init(id: String,
                  housingType: String,
                  isFavorite: Bool = false,
                  pricePerMonth: String,
                  purchasePrice: String,
                  bedroomCountDesc: String,
                  ownerCountDescription: String,
                  areaMetricDesc: String,
                  dateLeftDescription: String,
                  houseImageUrl: String) {
        self.id = id
        self.housingType = housingType
        self.isFavorite = isFavorite
        self.pricePerMonth = pricePerMonth
        self.purchasePrice = purchasePrice
        self.bedroomCountDesc = bedroomCountDesc
        self.ownerCountDescription = ownerCountDescription
        self.depreciationPerYear = areaMetricDesc
        self.houseLocationDescription = dateLeftDescription
        self.houseImageUrl = houseImageUrl
    }
    
    private func buildMonthlyPriceAttributedString(price: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: "")
        let text1 = NSAttributedString(string: "$\(self.pricePerMonth)", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20),
        ])
        
        let text2 = NSAttributedString(string: "/mths".uppercased(), attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18),
        ])
        
        /// Append attributed text
        attributedString.append(text1)
        attributedString.append(text2)
        return attributedString
    }
    
    static func getDummyHousingInfo() -> HouseInfoItem {
        return HouseInfoItem(
            id: "123",
            housingType: "Condo",
            isFavorite: false,
            pricePerMonth: "200",
            purchasePrice: "$202,000",
            bedroomCountDesc: "2 Bedrooms",
            ownerCountDescription: "2 Bathrooms",
            areaMetricDesc: "6 x 7.5 m(sq)",
            dateLeftDescription: "House 28, A block, Madison Ave, New York",
            houseImageUrl: "img_apartment_indoor")
    }
    
    static func getDummyCurrentHousingInfo() -> HouseInfoItem {
        return HouseInfoItem(
            id: "3123",
            housingType: "Apartment",
            isFavorite: false,
            pricePerMonth: "120",
            purchasePrice: "$145,400",
            bedroomCountDesc: "1 Bedroom",
            ownerCountDescription: "1 Bathroom",
            areaMetricDesc: "4 x 5.5 m(sq)",
            dateLeftDescription: "House 44, Z block, General Ave, New York",
            houseImageUrl: "img_apartment_indoor_2")
    }
}


