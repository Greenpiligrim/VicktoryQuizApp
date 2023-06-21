//
//  Home.swift
//  Vicktory
//
//  Created by Greenpilligrim on 17/06/23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var vm: ViewModel
  
    
    
    var body: some View {
        
        VStack {
            if vm.nextScreen {
                QuizzView()
            
            } else {
                StartingView()
            }
        }
        .animation(.easeInOut(duration: 1), value: vm.nextScreen)
    }
}

