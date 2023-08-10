//
//  QuestionRepository.swift
//  Curitrivia
//
//  Created by Laura Machado Isolani on 01/08/23.
//

import Foundation

class QuestionRepository: ObservableObject{
    
    @Published var currentQuestion: Question
    @Published var empty: Bool = false
    
    var questions: [Question] = [
        
        Question(image: "bandeclay",
                 title: "Um sinônimo para Bandeclay é:",
                 Answer: ["Anteburger" : true,
                          "Toggles": false,
                          "Tchélvis": false]),
        
        Question(image: "plá",
                 title: "Qual é o nome do artista de rua, que é famoso por tocar violão e usar roupa branca pelas ruas da cidade?",
                 Answer: ["plá" : true,
                          "plé": false,
                          "plí": false]),
        
        Question(image: "oilman",
                 title: "Qual é a cor da sunga default do Oil Man?",
                 Answer: ["vermelha" : true,
                          "azul": false,
                          "verde": false]),
        
        Question(image: "profGaldino",
                 title: "Complete o jingle:\nProfessor Galdino\nProfessor Galdino ",
                 Answer: ["13025" : false,
                          "45021": true,
                          "17021": false]),
        
        Question(image: "predioGira",
                 title: "Em qual bairro de Curitiba está localizado o prédio que gira?",
                 Answer: ["Mossunguê" : true,
                          "Campina do Siqueira": false,
                          "Campo Comprido": false]),
        
        Question(image: "tourBiqueira",
                 title: "Qual linha de ônibus Curitibana é conhecida como Tour Biqueira?",
                 Answer: ["Sítio Cercado " : false,
                          "Caiuá - Cachoeira": false,
                          "Alferes Poli": true]),
        
        Question(image: "xMontanha",
                 title: "X-Montanha e Monstro são sanduíches famosos de qual lanchonete?",
                 Answer: ["Lanchonete Montesquieu" : true,
                          "Djalma Lanches": false,
                          "Copo Sujo": false]),
        
        Question(image: "waldo",
                 title: "A lanchonete Waldo X-Picanha ficou famosa por vender:",
                 Answer: ["X-Picanha" : false,
                          "X-Montanha": false,
                          "Cocaína": true]),
        
        Question(image: "pl",
                 title: "Complete o slogan de campanha do candidato a Deputado Estadual e empreendedor \nPedro \"PL\" Lauro:",
                 Answer: ["Pedro Lauro quer cassinos no Brasil" : true,
                          "Pedro Lauro quer a legalização da \nmaconha": false,
                          "Pedro Lauro quer almoço grátis": false]),
        
        Question(image: "muhammadAli",
                 title: "Quantos carros Puma o pugilista Muhammad Ali comprou em sua visita à capital Paranaense em 1987?",
                 Answer: ["4" : false,
                          "312": false,
                          "1440": true]),
        
        Question(image: "prefeitos",
                 title: "Qual foi o melhor prefeito que Curitiba já teve?",
                 Answer: ["Jaime Lerner" : true,
                          "Gustavo Fruet": false,
                          "Rafael Greca": false]),
        
        Question(image: "caiuaCachoeira",
                 title: "Qual é a PIOR linha de ônibus de curitiba e região metropolitana?",
                 Answer: ["CAIUA/CACHOEIRA" : true,
                          "CACHOEIRA/CAIUA": true,
                          "702 (CAIUA/CACHOEIRA)": true]),
        
        Question(image: "etTransamerica",
                 title: "Qual é a verdadeira identidade do ET da Transamérica?",
                 Answer: ["Rodrigo Cavassin" : false,
                          "Daiki Koketsu Saka": false,
                          "Douglas Bay": true]),
        
        Question(image: "julioIglesias",
                 title: "De qual estabelecimento curitibano o cantor Julio Iglesias foi enxotado após se envolver em uma briga?",
                 Answer: ["Riser Pastéis" : false,
                          "Pizzaria Itália": false,
                          "Gato Preto": true]),
        
        Question(image: "carroDoSonho",
                 title: "Escolha a sequência correta:",
                 Answer: ["Sonhos de nata, creme, doce de leite, chocolate, de goiaba o sonho freguesia" : true,
                          "Sonhos de creme, nata, doce de leite, de goiaba o sonho freguesia": false,
                          "Sonhos de nata, doce de leite, chocolate, goiabada o sonho freguesia": false]),
        
        Question(image: "tubo",
                 title: "Qual estabelecimento ficou conhecido por sua decoração temática de estação tubo?",
                 Answer: ["Restaurante" : false,
                          "Motel": true,
                          "Shopping": false]),
        
        Question(image: "vilaPantanal",
                 title: "Qual é a fonte usada no letreiro da entrada da Vila Pantanal?",
                 Answer: ["Arial" : false,
                          "Comic Sans": true,
                          "Impact": false]),
        
        Question(image: "uniaoFlasco",
                 title: "Djalma Lanches, Lanchonete Montesquieu e Garrafeiros são estabelecimentos frequentados por estudantes de qual instituição?",
                 Answer: ["UTFPR" : true,
                          "UFPR": false,
                          "FAP": false])
        
    ]
    
    init(){
        questions.shuffle()
        currentQuestion = questions.first!
        questions.remove(at: 0)
    }
    
    func getNextQuestion(){
        guard let question = questions.first
        else {
            empty = true
            return
        }
        currentQuestion = question
        questions.remove(at: 0)
    }
}
