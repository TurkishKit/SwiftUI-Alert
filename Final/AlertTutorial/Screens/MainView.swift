//
//  MainView.swift
//  AlertTutorial
//
//  Created by Ufuk Kosker on 11.01.2021.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @State var questions: [Question] = []
    @State var isPresented = false
    @State var showingAlert = false
    
    // MARK: - UI Elements
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(questions) { question in
                        NavigationLink(
                            destination: QuestionView(question: question),
                            label: {
                                GroupBox {
                                    HStack {
                                        Text("\(question.text)")
                                        Spacer()
                                    }
                                }
                                .foregroundColor(.black)
                                .padding(EdgeInsets(top: 12, leading: 12, bottom: 0, trailing: 12))
                            }
                        )
                    }
                }
            }
            .navigationBarTitle("Sorular")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        showingAlert = true
                    }) {
                        Image(systemName: "plus.circle")
                    }
            )
        }
        .alert(
            isPresented: $showingAlert,
            TextAlert(title: "Soru Oluştur!", action: { action in
                var isOperator = false
                let _operator: Question.Operations!
                let chosenOperator: String = action[2]!
                
                switch chosenOperator {
                case "+":
                    _operator = .arti
                case "-":
                    _operator = .eksi
                case "/":
                    _operator = .bolu
                case "*":
                    _operator = .carpi
                default:
                    isOperator = true
                    _operator = .arti
                }
                
                let newQuestion = Question(firstNumber: Int(action[0]!) ?? 0, secondNumber: Int(action[1]!) ?? 0, _operator: _operator)
                
                if !isOperator {
                    questions.insert(newQuestion, at: 0)
                }
            })
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
