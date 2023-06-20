//
//  Home.swift
//  Vicktory
//
//  Created by Greenpilligrim on 17/06/23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var vm: ViewModel
    @State var circlesIndicatorDisapear: Bool = false

    
    
    var body: some View {
        
        VStack(alignment: .center){
            if !vm.flagEndQuestions {
                VStack {
                    TextQestion
                    AnswerViewBlock()
                    NextButton
                }
                
            } else {
                
                StatisticView()
                
            }
                    
            
            CirclesIndicator
                .onChange(of: vm.flagEndQuestions) { _ in
                    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                            circlesIndicatorDisapear = true
                    }
                }
                .opacity(circlesIndicatorDisapear ? 0 : 1)
                .animation(.easeInOut(duration: 2), value: circlesIndicatorDisapear)


            
            
            
         
           
                
        }.animation(.easeInOut(duration: 0.5).delay(0.5), value: vm.flagEndQuestions)
    }

    
 

    
    
}

extension Home {
   private var NextButton: some View {
       VStack {
           
           Button {
                vm.nextButton()
                   
                
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 60)
                    .foregroundColor(Color.blue.opacity(0.8))
                    .overlay {
                        Text("NEXT")
                            .foregroundColor(Color.white)
                    }
        }
            .padding(.top, 40)
            .animation(.easeInOut, value: vm.index)
           Divider()
               .padding()
       }
    }
    
    private var CirclesIndicator: some View {
        ScrollView(.horizontal) {
            HStack {
                Spacer()
                
                ForEach(0..<moc.count) { index in
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(vm.circles.indices.contains(index) ? vm.circles[index] : .gray)
                    
                }
                
                Spacer()
            }
            .padding()
        }
    }

    
    private var TextQestion: some View {
        VStack {
            Text("Вопрос \(vm.index + 1) из \(moc.indices.count)")
                .foregroundColor(Color.theme.secondaryColor)
            Divider()
                .padding(.bottom, 20)
            HStack(alignment: .top) {
                Text(vm.question)
                    .foregroundColor(Color.theme.secondaryColor)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
            }.frame(maxHeight: 100)
                
                
            
            Divider()
                .padding()
        }
    }

}
