//
//  TextStartingView.swift
//  Vicktory
//
//  Created by Greenpilligrim on 21/06/23.
//

import SwiftUI



struct TextStartingView: View {
    @State private var textOpacity: Double = 0.0
    @Binding var textIndex: Int
    
    var body: some View {
        Text(circleColor(for: textIndex))
            .font(.system(size: 30))
            .multilineTextAlignment(.center)
            .opacity(textOpacity)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                    textOpacity = 1.0
                }
            }
          
    }
    private func circleColor(for index: Int) -> String {
        switch index {
        case 0:
            return "Легкий"
        case 1:
            return "Средний"
        case 2:
            return "Сложный"
        case 3:
            return "Смешанный"
        default:
            return "Выберите уровень сложности"
        }
    }
}

struct TextStartingView_Previews: PreviewProvider {
   
    static var previews: some View {
        StartingView()
    }
}


