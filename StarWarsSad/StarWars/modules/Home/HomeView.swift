//
//  HomeView.swift
//  StarWars
//
//  Created by Pilar García on 21/3/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel : HomeViewModel
    
    init(repository: RepositoryProtocol) {
        _viewModel = StateObject(
            wrappedValue: HomeViewModel(
                repository: repository
            )
        )
    }
    
    var body: some View {
        ZStack {
            
            VStack {
                HomeHeaderView(onMenuClick: {}, onSearchClick: {})
                Spacer()
            }
            
            VStack {
                
                ScrollView {
                    
                    VStack {
                        
                        if let planet = viewModel.planet {
                            PlanetInfoView(planet: planet)
                        }
                        
                        HStack {
                            
                        }
                        
                        
                    }
                    
                }
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding(.top, 24)
            .background(.clear)
        }
        .padding()
    }
}

struct HomeHeaderView: View {
    
    var onMenuClick: () -> Void
    var onSearchClick: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onMenuClick) {
                Image(systemName: "line.3.horizontal")
                    .frame(width: 48, height: 48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.blue, lineWidth: 1)
                        )
            }
                        
            Spacer()
            Button(action: onSearchClick) {
                Image(systemName: "magnifyingglass")
                    .frame(width: 48, height: 48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.blue, lineWidth: 1)
                        )
            }
        }
    }
    
}

struct PlanetInfoView: View {
    
    var planet: Planet
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .padding(.top, 32)
                .foregroundColor(.pink)
            
            VStack {
                Circle()
                    .frame(width: 236, height: 236)
                    .foregroundColor(.black)
                    .overlay{
                        Text("Planeta")
                            .foregroundColor(.white)
                    }
                
                Text(planet.name)
                
                VStack {
                    HStack {
                        
                    }
                }
                .background(
                    .black,
                    in: RoundedRectangle(cornerRadius: 8)
                )
            }
        }
        .padding(.top, 0)
        
         
    }
}

struct FilmsListView: View {
    
    var body: some View {
        VStack {
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(repository: Navigator.getRepositoryForPreview())
    }
}
