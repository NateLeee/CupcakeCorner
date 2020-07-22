//
//  Order.swift
//  CupcakeCorner
//
//  Created by Nate Lee on 7/22/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import Foundation

class Order: ObservableObject, Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 1
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var cost: Double {
        var price = Double(quantity) * 2
        
        price += Double(type) / 2 // More complicated, more expensive.
        price += extraFrosting ? Double(quantity) : 0
        price += addSprinkles ? Double(quantity) / 2 : 0
        
        return price
    }
    
    var hasValidAddress: Bool {
        if (name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty) {
            return false
        }
        return true
    }
    
    required init(from decoder: Decoder) {
        
    }
    
    init() { }
    
    func encode(to encoder: Encoder) {
        
    }
}
