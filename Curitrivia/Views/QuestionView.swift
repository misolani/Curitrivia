//
//  QuestionView.swift
//  Curitrivia
//
//  Created by Laura Machado Isolani on 01/08/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var statsManager: StatsManager
    
    @StateObject var questionRepository: QuestionRepository
    
    @State var selectedAnswer: String?
    @State var countScore = 0
    
    var previousStreak: Int
    
    var body: some View {
        VStack{
            VStack(){
                Text(questionRepository.currentQuestion.title)
                    .font(.title2)
                    .foregroundColor(Color("Roxo"))
                    .bold()
                    .padding(.horizontal, 11)
                    .padding(.top)
                    .tracking(0.1)
                
                Spacer()
                Image(questionRepository.currentQuestion.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 325, height: 200)
                    .cornerRadius(20)
                    .padding(.bottom)
                    
            }.frame(maxWidth: .infinity)
                .frame(height: 450)
            
                .background(Color("Rosa 1"))
                .cornerRadius(20)
            
            
            ForEach(questionRepository.currentQuestion.Answer
                .sorted(by: {a,b in
                    return a.key < b.key })
                    , id: \.key) { key, value in
                
                Button(action: {
                    
                    if selectedAnswer != nil{
                        return
                    }
                    
                    selectedAnswer = key
                    
                    if value == true{
                        statsManager.score += 1
                    } else {
                        statsManager.lives += 1
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.questionRepository.getNextQuestion()
                            selectedAnswer = nil
                    }
                    
                }, label: {
                    ZStack{
                        
                        Text(key)
                            .foregroundColor(Color("Roxo"))
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 90)
                            .background(Color("Amarelo"))
                            .cornerRadius(20)
                        
                        
                        if selectedAnswer == key{
                            if value == true{
                                
                                Text(key)
                                    .foregroundColor(Color("Roxo"))
                                    .bold()
                                    .frame(maxWidth: .infinity, maxHeight: 90)
                                    .background(Color("Verde"))
                                    .cornerRadius(20)
                                
                            } else {
                                
                                Text(key)
                                    .foregroundColor(Color("Roxo"))
                                    .bold()
                                    .frame(maxWidth: .infinity, maxHeight: 90)
                                    .background(Color("Vermelho"))
                                    .cornerRadius(20)
                            }
                        }
                    }
                })
            }
            Spacer()
        }.padding(.horizontal)
        
    }
}



struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(questionRepository: QuestionRepository(), previousStreak: 4)
    }
}
