//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Nate Lee on 7/20/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var orderWrapper = OrderWrapper()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cupcake type", selection: $orderWrapper.order.type) {
                        ForEach(0 ..< Order.types.count, id: \.self) {
                            Text("\(Order.types[$0])")
                        }
                    }
                    //.pickerStyle(SegmentedPickerStyle())
                    
                    Stepper("Number of cakes: \(orderWrapper.order.quantity)", value: $orderWrapper.order.quantity, in: 3 ... 20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $orderWrapper.order.specialRequestEnabled.animation())
                    // Toggle("Any special requests?", isOn: $order.specialRequestEnabled)
                    
                    if orderWrapper.order.specialRequestEnabled { // Let there be animation!
                        Toggle("Add extra frosting", isOn: $orderWrapper.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $orderWrapper.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(orderWrapper: orderWrapper)) {
                    //NavigationLink(destination: Text("order: order")) {
                        Text("Deliver details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
