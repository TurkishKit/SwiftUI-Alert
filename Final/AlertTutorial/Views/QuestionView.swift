//
//  QuestionView.swift
//  AlertTutorial
//
//  Created by Can Balkaya on 15.01.2021.
//

import SwiftUI

struct QuestionView: View {
    
    // MARK: - Properties
    let question: Question
    @State var answer = 0
    @State var result = false
    @State var showingAlert = false
    
    // MARK: - UI Elements
    var body: some View {
        VStack {
            ZStack {
                Color(UIColor.systemGroupedBackground)
                
                VStack {
                    VStack {
                        Text("\(question.text)")
                        NumberTextField(value: $answer)
                    }
                    .padding(.top)
                    
                    Button(action: {
                        if answer == question.result {
                            result = true
                        } else {
                            result = false
                        }
                        
                        showingAlert = true
                    }) {
                        GroupBox {
                            ZStack {
                                Color(UIColor.lightGray)
                                    .cornerRadius(12)
                                
                                Text("Kontrol Et")
                            }
                        }
                        .foregroundColor(.white)
                    }
                    .padding(.bottom)
                }
            }
            .cornerRadius(15)
            .frame(width: 300, height: 200)
        }
        .navigationBarTitle("Soru")
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text(result ? "Doğru!" : "Yanlış"), message: Text(result ? "Cevabın doğru. Tebrikler! 🥳" : "Cevabın yanlış. Bir daha deneyebilirsin."), dismissButton: .cancel())
        })
    }
}
