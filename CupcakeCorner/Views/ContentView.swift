//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Nate Lee on 7/20/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cupcake type", selection: $order.type) {
                        ForEach(0 ..< Order.types.count, id: \.self) {
                            Text("\(Order.types[$0])")
                        }
                    }
                    //.pickerStyle(SegmentedPickerStyle())
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 1 ... 20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    // Toggle("Any special requests?", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled { // Let there be animation!
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
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
