//
//  StatisticView.swift
//  Vicktory
//
//  Created by Greenpilligrim on 19/06/23.
//

import SwiftUI
struct StatisticView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var disaperTextStat: Bool = false

    var body: some View {
        VStack {
            Text("Правильных ответов \(vm.resultStatistic) из \(moc.indices.count)")
                .foregroundColor(Color.theme.secondaryColor)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .fontWeight(.black)
                .padding()
                .opacity(disaperTextStat ? 0 : 1)
                .animation(Animation.easeInOut(duration: 1.5).delay(2))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            disaperTextStat = true
                        }
                    }
                }

            ButtonNextScreen(nameButton: "Пройти еще раз", code: vm.againScreenBottn)
        }
    }
}

