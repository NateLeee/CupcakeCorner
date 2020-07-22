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
    
    required init(from decoder: Decoder) {
        
    }
    
    init() { }
    
    func encode(to encoder: Encoder) {
        
    }
}
