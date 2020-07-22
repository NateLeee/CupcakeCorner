//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Nate Lee on 7/22/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                Image("cupcakes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width)
                
                Text("Your order is $\(self.order.cost, specifier: "%.2f")")
                
                Button("Place Order") {
                    
                }
                .padding()
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
