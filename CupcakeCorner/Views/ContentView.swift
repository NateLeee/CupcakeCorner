//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Nate Lee on 7/20/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var response: Response = Response(results: [Result]())
    
    var body: some View {
        List(response.results, id: \.trackId) { result in
            VStack(alignment: .leading) {
                Text(result.trackName)
                    .font(.headline)
                
                Text(result.collectionName)
            }
        }
        .onAppear(perform: loadData)
    }
    
    private func loadData() {
        let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error != nil else {
                print("URLSession.shared.dataTask... error!")
                return
            }
            
            guard let data = data else {
                print("data is nil!")
                return
            }
            
            guard let decoded = try? JSONDecoder().decode(Response.self, from: data) else {
                print("JSONDecoder().decode() error!")
                return
            }
            
            DispatchQueue.main.async {
                self.response.results = decoded.results
            }
            
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
