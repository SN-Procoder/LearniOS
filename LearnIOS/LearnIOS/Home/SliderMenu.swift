//
//  SliderMenu.swift
//  LearnIOS
//
//  Created by Senthil Narayanan on 20/03/22.
//

import SwiftUI

struct SliderMenu: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                                .imageScale(.large)
                            Text("Profile")
                                .foregroundColor(.gray)
                                .font(.headline)
                        }
                            .padding(.top, 100)
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.gray)
                                .imageScale(.large)
                            Text("Messages")
                                .foregroundColor(.gray)
                                .font(.headline)
                        }
                            .padding(.top, 30)
                        HStack {
                            Image(systemName: "gear")
                                .foregroundColor(.gray)
                                .imageScale(.large)
                            Text("Settings")
                                .foregroundColor(.gray)
                                .font(.headline)
                                .onTapGesture {

                                }
                        }
                            .padding(.top, 30)
            
            HStack {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Logout")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
                .padding(.top, 30)
            Spacer()
                }.padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.black)
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
    }
}

struct SliderMenu_Previews: PreviewProvider {
    static var previews: some View {
        SliderMenu()
    }
}
