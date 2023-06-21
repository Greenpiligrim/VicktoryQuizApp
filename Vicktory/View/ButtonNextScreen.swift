//
//  ButtonNextScreen.swift
//  Vicktory
//
//  Created by Greenpilligrim on 21/06/23.
//

import SwiftUI

struct ButtonNextScreen: View {
    @EnvironmentObject var vm: ViewModel
    @State private var buttonAnimation = false
    let nameButton: String
    let code: () -> ()

    var body: some View {
        HStack {
            Button {
                    code()
            } label: {
                Text(nameButton)
                    .padding()
            }
            .tint(.blue)
            .buttonStyle(.bordered)
            .shadow(radius: 20)
            .scaleEffect(buttonAnimation ? 1.1 : 1.0)
            .onAppear{
                withAnimation(.easeInOut(duration: 1).repeatForever()) {
                    buttonAnimation.toggle()
                }
            }
        }
    }
}



//struct ArrowsNextView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonNextScreen()
//    }
//}
