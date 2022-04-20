//
//  HomeView.swift
//  LearnIOS
//
//  Created by Senthil Narayanan on 20/03/22.
//

import SwiftUI
struct HomeView: View {
    
    @State var showMenu = false

    var body: some View {
        
        GeometryReader { geometry in
            MainContentView()
                .frame(width: geometry.size.width, height: geometry.size.height)
            if self.showMenu {
                SliderMenu()
                    .frame(width: geometry.size.width/2)
                .transition(.move(edge: .leading))                            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: (
            Button(action: {
                withAnimation {
                    self.showMenu.toggle()
                    // SliderMenu()
                }
            }) {
                if(self.showMenu)
                {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                    
                }
                else{
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
               
            }
        ))
        .navigationBarTitle("Products", displayMode: .inline)

    }// Body
}// HomeView



struct MainContentView: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted", "Josh", "Rhonda", "Ted", "Josh", "Rhonda", "Ted", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
    
    var body: some View {
        ZStack {
            BaseView()
            VStack{
                List {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink(destination: Text(name)) {
                            Text(name)
                        } // NavigationLink
                    } // ForEach
                } // List
                .searchable(text: $searchText)

            } // VStack
            
            
        } //ZStack
       
    }// Body
}// HomeView



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
