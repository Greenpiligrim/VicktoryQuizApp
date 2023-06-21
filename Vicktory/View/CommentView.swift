//
//  CommentView.swift
//  Vicktory
//
//  Created by Greenpilligrim on 20/06/23.
//

import SwiftUI

struct CommentView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: ViewModel

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 30))
                        .foregroundColor(Color.theme.accent)

                }
                .padding()
               
            }
          }
           
            
            Spacer()
            VStack {
                    ScrollView {
                        if let comment = moc[vm.index].comment
                            {
                            Text(comment)
                                .font(.callout)
                                .padding()
                            if let indexImg = moc[vm.index].img {
                                Image("\(indexImg)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                        }
                }
            Spacer()
        }
    }
}


