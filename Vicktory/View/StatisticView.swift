//
//  StatisticView.swift
//  Vicktory
//
//  Created by Greenpilligrim on 19/06/23.
//

import SwiftUI

struct StatisticView: View {
    @EnvironmentObject var vm: ViewModel

    var body: some View {
        
            
            VStack {
                Text("Правильных ответов \(vm.result) из \(moc.indices.count)" )
                    .foregroundColor(Color.theme.secondaryColor)
                    .font(.callout)
                .fontWeight(.black)
                .padding()
                
                Button("Пройти снова"){
                
                }
                
            }
            
      
    }
}

