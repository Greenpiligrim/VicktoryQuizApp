//
//  ViewModel.swift
//  Vicktory
//
//  Created by Greenpilligrim on 18/06/23.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var arrAnswer: [String] = []
    @Published var trueAnswerCircle: Bool? = nil
    @Published var selectedAnswer: String?
    @Published var trueAnswer: String = ""
    @Published var question: String = ""
    @Published var circles: [Color] = []
    @Published var flagEndQuestions: Bool = false
    @Published var index = 0
    @Published var result = 0
    
    init(){
        goCheck()
    }
    
    
   private func countCorrectAnswers() {
        let correctColor = Color.green
        let correctCount = circles.filter { $0 == correctColor }.count
        result = correctCount
    }


    func goCheck() {
        guard index >= 0 && index < moc.count else {
            flagEndQuestions = true
            countCorrectAnswers()
            return
        }

        let answer = moc[index].answer
        arrAnswer.append(contentsOf: answer.shuffled())
        trueAnswer = moc[index].trueAnswer
        question = moc[index].question
    }

    
    private func createCircleAnswers() {
        
           let colorr = colorCircleIndicator()
            circles.append(colorr)
        
    }
    
    
    
    
    
    
    
    func nextQuestion() {
        guard index < moc.count else {return}
        index += 1
        arrAnswer = []
        goCheck()
    }
    
    
    
    func nextButton() {
        checkButton()
        createCircleAnswers()
        selectedAnswer = nil
        trueAnswerCircle = nil
        nextQuestion()
    }
    
    func checkButton() {
        trueAnswerCircle = checkAnswer()
    }
    
    func buttonColor(for answer: String) -> Color {
        if let selectedAnswer = selectedAnswer, selectedAnswer == answer {
            // Цвет выбранного варианта ответа
            return Color.gray.opacity(0.8)
        } else {
            // Цвет обычного варианта ответа
            return Color.theme.accent
        }
    }
    func textColor(for answer: String) -> Color {
        if let selectedAnswer = selectedAnswer, selectedAnswer == answer {
            // Цвет текста для выбранного варианта ответа
            return Color.white
        } else {
            // Цвет текста для обычного варианта ответа
            return Color.theme.secondaryColor
        }
    }
    
    private func checkAnswer() -> Bool {
        return selectedAnswer == trueAnswer ? true : false
    }
    private func colorCircleIndicator() -> Color {
        return trueAnswerCircle.map { $0 ? .green : .red } ?? .gray
    }
    

}
