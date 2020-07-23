//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Nate Lee on 7/22/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var orderWrapper: OrderWrapper
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $orderWrapper.order.name)
                
                TextField("Street Address", text: $orderWrapper.order.streetAddress)
                
                TextField("City", text: $orderWrapper.order.city)
                
                TextField("Zip Code", text: $orderWrapper.order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(orderWrapper: orderWrapper)) {
                //NavigationLink(destination: Text("order: order")) {
                    Text("Check Out")
                }
            }
            .disabled(!orderWrapper.order.hasValidAddress)
        }
        .navigationBarTitle("Checkout Details", displayMode: .inline)
    }
}


