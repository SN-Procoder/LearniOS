//
//  LoadingIndicator.swift
//  LearnIOS
//
//  Created by Senthil Narayanan on 21/04/22.
//

import SwiftUI

struct LoadingIndicator: View {
    var scaleSize: CGFloat = 1.0
    @Binding var isShowing: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .trailing){
                VStack(alignment: .center, spacing: 10){
                    Spacer()
                    HStack{
                        Spacer()
                        VStack(alignment: .center, spacing: 10){
                            
                            ProgressView()
                                .scaleEffect(scaleSize, anchor: .center)
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            Text("Loading ... ")
                        }
                        .frame(width: geometry.size.width / 2,
                               height: geometry.size.height / 5, alignment: .center)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .opacity(isShowing ? 0.8 : 0)
                        Spacer()

                    }
                    Spacer()

                }
            }
            
            
            
            
        }
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator(isShowing:.constant(true))
    }
}
