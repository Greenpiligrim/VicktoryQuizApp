//
//  StartingView.swift
//  Vicktory
//
//  Created by Greenpilligrim on 20/06/23.
//

import SwiftUI

struct StartingView: View {
    @EnvironmentObject var vm: ViewModel

    @State private var circleOpacities = [0.4, 0.4, 0.4, 0.4]
    @State private var ovalOpacity: Double = 0.4
    @State private var selectedCircleIndex: Int?
    
    var body: some View {
        VStack {
            VStack {
                TextStartingView(textIndex: $vm.startLevelIndex)
                    .padding()
            }
            
            VStack {
                VStack {
                    HStack {
                        ForEach(0..<circleOpacities.count) { index in
                            Circle()
                                .frame(width: 50)
                                .foregroundColor(circleColor(for: index))
                                .opacity(circleOpacity(for: index))
                                .onTapGesture {
                                    withAnimation {
                                        updateCircleSelection(index: index)
                                        
                                    }
                                }
                            
                        }
                    }
                }
            }
            
           
            if vm.startLevelIndex != 4 {
                ButtonNextScreen(nameButton: "Продолжить", code: vm.nextScreenButtn)
                    .padding(.top, 100)
            }
        }
    }
    
    private func circleColor(for index: Int) -> Color {
        switch index {
        case 0:
            return .gray
        case 1:
            return .green
        case 2:
            return .red
        case 3:
            return .blue
        default:
            return .clear
        }
    }
    
    private func circleOpacity(for index: Int) -> Double {
        if let selectedCircleIndex = selectedCircleIndex {
            return index == selectedCircleIndex ? 1.0 : 0.2
        } else {
            return circleOpacities[index]
        }
    }
    
    private func updateCircleSelection(index: Int) {
        selectedCircleIndex = index
        ovalOpacity = 0.2
        vm.startLevelIndex = index
    }
}



struct StartingView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}
