//
//  Menu.swift
//  Curitrivia
//
//  Created by Laura Machado Isolani on 01/08/23.
//

import SwiftUI

struct Menu: View {
    
 
    var body: some View {
    
        VStack{
            
            Image("imageMenu")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400)
            NavigationLink {
                Play()
            } label: {
                Image(systemName: "play.fill")
                    .padding(20)
                    .foregroundColor(Color("Roxo"))
                    .frame( width: 300)
                    .background(Color("Amarelo"))
                    .cornerRadius(20)
            }.padding(.top)
            
            NavigationLink {
                RankingView(addedName: true)
            } label: {
                Image(systemName: "trophy")
                    .padding(20)
                    .foregroundColor(Color("Roxo"))
                    .frame( width: 300)
                    .background(Color("Amarelo"))
                    .cornerRadius(20)
            }.padding(.top)
            
        }.padding()
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
