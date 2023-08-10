//
//  ContentView.swift
//  Curitrivia
//
//  Created by Laura Machado Isolani on 01/08/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            VStack{
                Menu()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Bege"))
        }.background(.clear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
