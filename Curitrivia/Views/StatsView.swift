//
//  StatsView.swift
//  Curitrivia
//
//  Created by Laura Machado Isolani on 01/08/23.
//

import SwiftUI

struct StatsView: View {
    
    var score: Int
    var body: some View {
        VStack{
            Image("Curitrivia")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            VStack{
                Text("Your Answer Streak")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("Roxo"))
                    .padding(.top)
                
                Image("arteCapivara")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                
                Text("\(score) capivárias!")
                    .font(.title)
                    .foregroundColor(Color("Roxo"))
                    .bold()
                    .padding(.bottom, 5)
                
                if score > 0 {
//                    score <  10{
//                    Text("Sabe de nada, piá lazarento!")
//                        .font(.title3)
//                        .foregroundColor(Color("Roxo"))
//                        .padding(.bottom)
//                } else if score < 11 {
//                    Text("É só um piá de prédio mesmo")
//                        .font(.title3)
//                        .foregroundColor(Color("Roxo"))
//                        .padding(.bottom)
//                } else {
                    Text("Esse piá toma muito leite quente!")
                        .font(.title3)
                        .foregroundColor(Color("Roxo"))
                        .padding(.bottom)
                }
                
                
            }.frame(maxWidth: .infinity)
            .background(Color("Rosa 1"))
            .cornerRadius(20)
            .padding(.vertical)
            
            NavigationLink {
                Play()
            } label: {
                HStack{
                    Text("Tentar de novo")
                        .font(.title2)
                        .foregroundColor(Color("Roxo"))
                        .bold()
                        .padding(.vertical)
                        
                    
                    Image(systemName: "arrow.clockwise")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Roxo"))
                        
                    
                }.frame(maxWidth: .infinity)
                    .background(Color("Amarelo"))
                    .cornerRadius(20)
                    
            }
            
            NavigationLink {
                RankingView(score: score)
            } label: {
                HStack{
                    Text("Incluir ao ranking")
                        .font(.title2)
                        .foregroundColor(Color("Roxo"))
                        .padding(.vertical)
                        
                    
                    Image(systemName: "trophy")
                        .font(.title2)
                        .foregroundColor(Color("Roxo"))
                        
                    
                }.frame(maxWidth: .infinity)
                    .background(Color("Amarelo"))
                    .cornerRadius(20)
                    
            }
            
            Spacer()

        }.padding()
            .background(Color("Bege"))
        
    }
}
    
    struct StatsView_Previews: PreviewProvider {
        static var previews: some View {
            StatsView(score: 2)
        }
    }

