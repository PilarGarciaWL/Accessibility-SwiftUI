//
//  HomeView.swift
//  StarWars
//
//  Created by Pilar García on 21/3/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                
            }
            
            ScrollView {
                
                VStack {
                    
                    PlanetInfoView()
                    
                    HStack {
                        
                    }
                    
                    
                }
                
            }
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct PlanetInfoView: View {
    
    var body: some View {
        
        ZStack {
            
        }
    }
}

struct Filmography: View {
    
    var body: some View {
        VStack {
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
