//
//  QuizzView.swift
//  Vicktory
//
//  Created by Greenpilligrim on 21/06/23.
//

import SwiftUI

struct QuizzView: View {
    @EnvironmentObject var vm: ViewModel

    @State var circlesIndicatorDisapear: Bool = false
    @State private var showModal = false

    var body: some View {
        VStack {
            
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
}

struct QuizzView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzView()
    }
}

extension QuizzView {
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
            VStack {
                
                VStack {
                    HStack {
                        Text(vm.question)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        if moc[vm.index].comment != nil {
                            arrowComment
                        }
                    }
                }
                if moc[vm.index].sound != nil {
                    TestView()
                }
                
            }
            .frame(maxHeight: 100)
            .foregroundColor(Color.theme.secondaryColor)
            
            
            
            Divider()
                .padding()
        }
    }
   private var arrowComment: some View {
        
        Image(systemName: "arrow.up.forward.app.fill")
            .foregroundColor(.blue)
            .font(.system(size: 20))
            .onTapGesture {
                showModal = true
            }
            .sheet(isPresented: $showModal) {
                CommentView()
            }
    }

}
