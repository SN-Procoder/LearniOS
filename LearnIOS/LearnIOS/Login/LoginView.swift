//
//  ContentView.swift
//  LearnIOS
//
//  Created by Senthil Narayanan on 18/03/22.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var isActive = false
    @State private var showAlert = false

    var body: some View {
        NavigationView{
            
            ZStack {
                //BaseView()
                VStack(alignment: .center, spacing: 10){
                    
                   
                    
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100 , height: 100)
                            .padding(.leading, 25)
                            .padding(.top,60)
                        Text("Proceed With your").font(.system(size: 20))
                            .foregroundColor(.black)
                            .padding(.leading,25)
                            .padding(.top,40)
                        Text("Login")
                            .foregroundColor(.black)
                            .padding(.leading,25)
                            .padding(.top,0)
                            .font(.system(size: 30, weight: .heavy, design: .default))

                        Text("User Name").font(.system(size: 15))
                            .foregroundColor(.black)
                            .padding(.leading,25)
                            .padding(.top,40)

                          TextField(
                            "User Name",
                            text: $viewModel.userDetail.email
                          ).padding(.leading,25)
                            .padding(.top,0)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        Text("Password").font(.system(size: 15))
                            .foregroundColor(.black)
                            .padding(.leading,25)
                            .padding(.top,20)
                        SecureField(
                            "Password",
                            text: $viewModel.userDetail.password
                          ).padding(.leading,25)
                            .padding(.top,0)
                            .font(.system(size: 20))
                            .foregroundColor(.black)

                    }
                    .padding(.bottom,30)
                    
               
                    

                    VStack(alignment:.center, spacing: 10){
                        
                        NavigationLink(destination: HomeView(), isActive: $isActive) {
                            Button {
                                   // run your code
                                   
                                   // then set
                                if(viewModel.userDetail.isValidUser())
                                {
                                    isActive = true
                                    showAlert = false;
                                }
                                else{
                                    isActive = false
                                    showAlert = true;
                                }

                               }label: {
                                   Text("Log In")
                               }
                                 }.buttonStyle(PlainButtonStyle())
                            .font(.system(size: 20))
                            .frame(width: 200, height: 60, alignment: .center)
                            .background(.red)
                            .padding()
                            .alert( isPresented: $showAlert) {
                                Alert(title: Text("Message"), message: Text("Wrong Credentials"), dismissButton: .default(Text("Got it!")))
                            }
                                               
                        NavigationLink(destination: HomeView()) {
                                    Text("Forget Password?")
                            
                                 }.buttonStyle(PlainButtonStyle())
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                        
                    }
                    Spacer()
                }
            }.navigationTitle("Learn iOS with Swift").foregroundColor(.white)
                .font(.system(size: 12))
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)

        }
        
       
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct WeatherDayView: View {
    var dayOftheWeek:String
    var tempratur:String
    var body: some View {
        VStack{
            Text(dayOftheWeek)
                .font(.system(size: 20,weight: .medium))
                .foregroundColor(.white)
            Image(systemName: "cloud.sun.fill")
                .renderingMode(.original)
                .resizable().aspectRatio(contentMode: .fit)
                .padding(.all, 5.0)
                .frame(width: 40, height: 40)
            Text(tempratur)
                .font(.system(size: 20,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BaseView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.blue, Color("LightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}

struct CityView: View {
    var body: some View {
        VStack(spacing: 10){
            Text("Chennai, MAA")
                .font(.system (size:32, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: "cloud.sun.fill")
                .renderingMode(.original)
                .resizable().aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("70°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}
