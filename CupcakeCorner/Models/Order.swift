//
//  Order.swift
//  CupcakeCorner
//
//  Created by Nate Lee on 7/22/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import Foundation

/*
class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case type
        case quantity
        case extraFrosting
        case addSprinkles
        case name, streetAddress, city, zip
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
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
        
        price += Double(quantity) * Double(type) / 2 // More complicated, more expensive.
        price += extraFrosting ? Double(quantity) : 0
        price += addSprinkles ? Double(quantity) / 2 : 0
        
        return price
    }
    
    var hasValidAddress: Bool {
        if (name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty) {
            return false
        }
        
        // Challenge I: - Our address fields are currently considered valid if
        // they contain anything, even if it’s just only whitespace.
        // Improve the validation to make sure a string of pure whitespace is invalid.
        if (isInvalidString(name) || isInvalidString(streetAddress) || isInvalidString(city) || isInvalidString(zip)) {
            return false
        }
        
        return true
    }
    
    private func isInvalidString(_ string: String) -> Bool {
        let charactersArray = Array(string)
        let charactersSet = Set(charactersArray)
        
        // A string of pure whitespace is not a valid.
        if (charactersSet.count == 1 && charactersSet.first == " ") {
            return true
        }
        
        // Otherwise, consider them valid for now.
        return false
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    init() { }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
}
*/

struct Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var cost: Double {
        var price = Double(quantity) * 2
        
        price += Double(quantity) * Double(type) / 2 // More complicated, more expensive.
        price += extraFrosting ? Double(quantity) : 0
        price += addSprinkles ? Double(quantity) / 2 : 0
        
        return price
    }
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if (name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty) {
            return false
        }
        
        if (isInvalidString(name) || isInvalidString(streetAddress) || isInvalidString(city) || isInvalidString(zip)) {
            return false
        }
        
        return true
    }
    
    private func isInvalidString(_ string: String) -> Bool {
        let charactersArray = Array(string)
        let charactersSet = Set(charactersArray)
        
        // A string of pure whitespace is not a valid.
        if (charactersSet.count == 1 && charactersSet.first == " ") {
            return true
        }
        
        // Otherwise, consider them valid for now.
        return false
    }
    
}

class OrderWrapper: ObservableObject {
    @Published var order: Order = Order()
}
