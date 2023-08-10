//
//  Play.swift
//  Curitrivia
//
//  Created by Laura Machado Isolani on 01/08/23.
//

import SwiftUI

struct Play: View {
    
    @StateObject var statsManager = StatsManager()
    @StateObject var questionRepository = QuestionRepository()
    
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        
        VStack{
            //GameStatus Bar
            ZStack {
                HStack{
                    ForEach(0..<3){ i in
                        Image(systemName: i < statsManager.lives ? "heart": "heart.fill")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Roxo"))
                            .padding(.horizontal, -5)
                    }
                }
                
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Roxo"))
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    HStack{
                        Text("\(statsManager.score)")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("Roxo"))
                        
                        Image("Capivara")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                            .padding(.leading, -5)
                    }.padding(.horizontal)
                    
                }//ign.padding(.bottom, 10)
                    .padding(.horizontal, 10)
            }
            if  (!questionRepository.empty) && (statsManager.lives < 3) {
                QuestionView(questionRepository: questionRepository, previousStreak: 0)
            }
            else{
                StatsView(score: statsManager.score)
            }
        }.navigationBarBackButtonHidden()
            .background(Color("Bege"))
            .environmentObject(statsManager)
    }
}

struct Play_Previews: PreviewProvider {
    static var previews: some View {
        Play()
    }
}
