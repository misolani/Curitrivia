//
//  RankingView.swift
//  Curitrivia
//
//  Created by Laura Machado Isolani on 03/08/23.
//

import SwiftUI

struct RankingView: View {
    
    var score: Int?
    @State var player: Player = Player()
    @State var ranking: Ranking = Ranking()
    @State var addedName: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack{
            
            HStack {
                    Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .fontWeight(.bold)
                                .foregroundColor(Color("Roxo"))
                                .padding(.horizontal)
                                .offset(y:-350)
                    }
                
                Spacer()
                  
            }
            Image("Curitrivia")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .offset(x: 5,y: -350)
            
            if addedName == false {
                
                
                
                
                VStack(){
                    Text("Qual o seu nome?")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color("Roxo"))
                        .padding()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color("Rosa 1"))
                            .frame(maxHeight: 50)
                        TextField("Ex:ToninhoRodrigues1337", text: $player.name)
                            .padding(.leading, 16)
                            .foregroundColor(.white)
                        
                    }.padding()
                    Button {
                        addedName = true
                        ranking.ranking.append(player)
                        ranking.save()
                        
                    } label: {
                        HStack{
                            Text("Next")
                                .foregroundColor(Color("Roxo"))
                                .bold()
                            
                        }
                    }.padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("Amarelo"))
                        .cornerRadius(15)
                        .padding()
                    
                    
                }.frame(maxWidth: .infinity)
                    .background(Color("Rosa 2"))
                    .cornerRadius(10)
            } else {
                
                
                VStack{
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 60)
                    VStack{
                        
                        Text("Ranking dos Jogadores")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color("Roxo"))
                        
                        let orderedRanking = ranking.ranking
                            .sorted(by: {a,b in
                                return a.score > b.score })
                        ForEach(Array(zip(orderedRanking.indices ,orderedRanking))
                                , id: \.0) { (ranking, key) in
                            
                            
                            Text("\(ranking + 1) - \(key.name)")
                                .frame(maxWidth: .infinity)
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color("Roxo"))
                                .padding()
                                .background(Color("Rosa 2"))
                                .cornerRadius(10)
                        }
                        
                        Button {
                            ranking.remove()
                        } label: {
                            Text("esvaziar ranking")
                                .foregroundColor(Color("Roxo"))
                        }

                        
                    }.padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("Rosa 1"))
                        .cornerRadius(20)
                }
                
            }
            
            
            
        }.padding()
            .frame(maxHeight: .infinity)
            .background(Color("Bege"))
            .onAppear {
                ranking.getRanking()
            }
            .navigationBarBackButtonHidden()
    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView(score: 10, player: Player(score: 10))
    }
}
