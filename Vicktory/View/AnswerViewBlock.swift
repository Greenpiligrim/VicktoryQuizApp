//
//  AnswerViewBlock.swift
//  Vicktory
//
//  Created by Greenpilligrim on 17/06/23.
//

import SwiftUI

struct AnswerViewBlock: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack {
           
            
            ForEach(vm.arrAnswer, id: \.self) {answer in
                Button {
                    vm.selectedAnswer = answer
                    vm.checkButton()
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 300, height: 60)
                        .foregroundColor(vm.buttonColor(for: answer))
                        .overlay {
                            Text(answer)
                                .lineLimit(1)
                                .foregroundColor(vm.textColor(for: answer))
                        }
                }
            }
        }
    }
}
