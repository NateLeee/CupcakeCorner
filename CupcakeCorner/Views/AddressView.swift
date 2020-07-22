//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Nate Lee on 7/22/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                
                TextField("Street Address", text: $order.streetAddress)
                
                TextField("City", text: $order.city)
                
                TextField("Zip Code", text: $order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check Out")
                }
            }
            .disabled(!order.hasValidAddress)
        }
        .navigationBarTitle("Checkout Details", displayMode: .inline)
    }
}


