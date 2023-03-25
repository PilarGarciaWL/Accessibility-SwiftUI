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
        NavigationStack(path: $viewModel.navigationPath) {
            VStack {
                
                HomeHeaderView(
                    onMenuClick: { viewModel.onMenuClicked() },
                    onSearchClick: { viewModel.onSearchClicked() }
                )
                
                if viewModel.showProgress {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            ProgressIndicator(color: .yellow)
                            Spacer()
                        }
                        Spacer()
                    }
                } else {
                    ScrollView {
                        VStack {
                            if let planet = viewModel.planet {
                                PlanetInfoView(
                                    planet: planet,
                                    onReadMoreClicked: { viewModel.onPlanetReadMoreClicked(planet) }
                                )
                            }
                            
                            HStack(spacing: 24) {
                                Button(action: { viewModel.onStarshipsClicked() }) {
                                    HStack {
                                        Spacer()
                                        VStack {
                                            Image(systemName: "airplane.circle.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 85, height: 85)
                                            Text("Starships")
                                        }.padding(.vertical)
                                        Spacer()
                                    }
                                }
                                .foregroundColor(.white)
                                .background(
                                    Color.black,
                                    in: RoundedRectangle(cornerRadius: 41)
                                )
                                
                                Button(action: { viewModel.onSpeciesClicked() }) {
                                    HStack {
                                        Spacer()
                                        VStack {
                                            Image(systemName: "person.and.background.dotted")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 85, height: 85)
                                            Text("Species")
                                        }.padding(.vertical)
                                        Spacer()
                                    }
                                }
                                .foregroundColor(.white)
                                .background(
                                    Color.black,
                                    in: RoundedRectangle(cornerRadius: 41)
                                )
                                
                            }
                            
                            if !viewModel.films.isEmpty {
                                FilmsListView(
                                    items: viewModel.films,
                                    onFilmItemClick: { item in
                                        viewModel.onFilmItemClick(item)
                                    },
                                    onViewAllFilms: { viewModel.onViewAllFilmsClicked() }
                                )
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationDestination(for: Destination.self) { destination in
                Navigator.getView(from: destination)
            }
        }.accentColor(.black)
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
                            .stroke(Color.black, lineWidth: 1)
                    )
            }.foregroundColor(.black)
            
            Spacer()
            Button(action: onSearchClick) {
                Image(systemName: "magnifyingglass")
                    .frame(width: 48, height: 48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }.foregroundColor(.black)
        }
    }
    
}

struct PlanetInfoView: View {
    
    var planet: Planet
    var onReadMoreClicked: () -> Void
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 41)
                .padding(.top, 32)
                .foregroundColor(.gray)
            
            VStack {
                Circle()
                    .frame(width: 236, height: 236)
                    .foregroundColor(.black)
                    .overlay{
                        Text("Planet")
                            .foregroundColor(.white)
                    }
                
                Text(planet.name)
                
                VStack {
                    VStack {
                        HStack {
                            Image(systemName: "cloud.sun.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            
                            Text("Climate: \(planet.climate)")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "mountain.2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Terrain: \(planet.terrain)")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "person.3.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Population: \(planet.population)")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "arrow.down.to.line")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Gravity: \(planet.gravity)")
                            Spacer()
                        }
                    }.padding(.all, 24)
                    
                    Button(action: { onReadMoreClicked() }) {
                        HStack {
                            Spacer()
                            Text("Read More")
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .frame(minHeight: 49)
                    .background(
                        Color.black,
                        in: RoundedRectangle(cornerRadius: 16)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                .background(
                    Color.yellow,
                    in: RoundedRectangle(cornerRadius: 41)
                )
            }
        }
        .padding(.top, 0)
        
        
    }
}

struct FilmsListView: View {
    
    let items: [Film]
    let onFilmItemClick: (Film) -> Void
    let onViewAllFilms: () -> Void
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Filmography")
                    .bold()
                    .padding(.all, 8)
                
                ForEach(items, id: \.self) { item in
                    Button(action: { onFilmItemClick(item) }) {
                        HStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 96, height: 100)
                                .foregroundColor(.white)
                                .overlay{
                                    Text("Image")
                                }
                            
                            VStack(alignment: .leading) {
                                Text(item.title)
                                Text("Espisode: \(item.episodeID)")
                                Text("Director: \(item.director)")
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }.foregroundColor(.black)
                }
                
                Button(action: { onViewAllFilms() }) {
                    HStack {
                        Spacer()
                        Text("View all films")
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .frame(minHeight: 49)
                .background(
                    Color.black,
                    in: RoundedRectangle(cornerRadius: 16)
                )
            }.padding()
        }
        .background(
            Color.yellow,
            in: RoundedRectangle(cornerRadius: 41)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(repository: Navigator.getRepositoryForPreview())
    }
}
