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
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    @State private var hasNetworkError = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                Image("cupcakes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width)
                
                Text("Your order is $\(self.order.cost, specifier: "%.2f")")
                
                Button("Place Order") {
                    self.placeOrder()
                }
                .padding()
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingAlert) { () -> Alert in
            if (hasNetworkError) {
                return Alert(title: Text("Oops!"), message: Text(alertMessage), dismissButton: Alert.Button.default(Text("Got it")))
            } else {
                return Alert(title: Text("✅ Success!"), message: Text(alertMessage), dismissButton: Alert.Button.default(Text("OK")))
            }
        }
    }
    
    func placeOrder() {
        let url = URL(string: "https://reqres.in/api/orders")!
        var request = URLRequest(url: url)
        request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let jsonData = try? JSONEncoder().encode(order)
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                DispatchQueue.main.async {
                    self.hasNetworkError = true
                    self.showingAlert.toggle()
                    self.alertMessage = "Network Error: \(error!.localizedDescription) Try it again later..."
                }
                return
            }
            
            guard let data = data else {
                return
            }
            
            if let decoded = try? JSONDecoder().decode(Order.self, from: data) {
                print(decoded)
                
                DispatchQueue.main.async {
                    self.showingAlert.toggle()
                    self.alertMessage = "Your order for \(decoded.quantity)x \(Order.types[decoded.type].lowercased()) cupcakes is on its way!"
                }
            }
            
        }.resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
