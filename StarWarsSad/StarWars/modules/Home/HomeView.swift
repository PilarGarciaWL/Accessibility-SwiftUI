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
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(Theme.colors.background1)
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        VStack() {
            NavigationLink(
                destination: viewModel.viewToNavigate,
                isActive: $viewModel.doNavigate) { EmptyView() }
            
            HomeHeaderView(
                onMenuClick: { viewModel.onMenuClicked() },
                onSearchClick: { viewModel.onSearchClicked() }
            )
            
            if viewModel.showProgress {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ProgressIndicator(color: Theme.colors.accent)
                        Spacer()
                    }
                    Spacer()
                }
            } else {
                ScrollView {
                    VStack(spacing: 24) {
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
                                        Image("ic_starships")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 130, height: 105)
                                        Text("Starships")
                                            .font(Theme.typography.body2)
                                    }.padding(.vertical)
                                    Spacer()
                                }
                            }
                            .foregroundColor(.white)
                            .background(
                                Theme.colors.strokeDark,
                                in: RoundedRectangle(cornerRadius: 41)
                            )
                            
                            Button(action: { viewModel.onSpeciesClicked() }) {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Image("ic_yoda")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 130, height: 105)
                                        Text("Species")
                                            .font(Theme.typography.body2)
                                    }.padding(.vertical)
                                    Spacer()
                                }
                            }
                            .foregroundColor(.white)
                            .background(
                                Theme.colors.strokeDark,
                                in: RoundedRectangle(cornerRadius: 41)
                            )
                            
                        }
                        
                        if !viewModel.filmography.isEmpty {
                            FilmsListView(
                                items: viewModel.filmography,
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
        .background(Theme.colors.background1)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
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
                    .background(Theme.colors.background4)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Theme.colors.strokeLight, lineWidth: 1)
                    )
            }.foregroundColor(Theme.colors.text)
            
            Spacer()
            Button(action: onSearchClick) {
                Image(systemName: "magnifyingglass")
                    .frame(width: 48, height: 48)
                    .background(Theme.colors.background4)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Theme.colors.strokeLight, lineWidth: 1)
                    )
            }.foregroundColor(Theme.colors.text)
        }
    }
    
}

struct PlanetInfoView: View {
    
    var planet: Planet
    var onReadMoreClicked: () -> Void
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 41)
                .fill(Theme.colors.background2)
                .overlay(
                    RoundedRectangle(cornerRadius: 41)
                        .stroke(Theme.colors.strokeLight, lineWidth: 1)
                )
                .padding(.top, 32)
                .padding(.horizontal, 1)
            
            VStack {
                ZStack {
                    VStack {
                        Spacer()
                        Ellipse()
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(
                                        colors: [Theme.colors.background2, Theme.colors.strokeLight]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: 236, height: 99)
                    }
                    
                    VStack {
                        Image("planet")
                            .frame(width: 247, height: 240)
                        
                        HStack {
                            Text("Rotation:")
                                .font(Theme.typography.subtitle2)
                                .foregroundColor(Theme.colors.text)
                            Text(planet.rotationPeriod)
                                .font(Theme.typography.subtitle1)
                                .foregroundColor(Theme.colors.text)
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 16)
                        .background(Theme.colors.background2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 41)
                                .stroke(Theme.colors.strokeLight, lineWidth: 1)
                        )
                    }
                }
                
                Text(planet.name)
                    .font(Theme.typography.title1)
                    .foregroundColor(Theme.colors.text)
                
                VStack {
                    VStack {
                        HStack(spacing: 12) {
                            Image("ic_climate")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            HStack(spacing: 8)  {
                                Text("Climate:")
                                    .font(Theme.typography.body2)
                                    .foregroundColor(Theme.colors.text)
                                Text(planet.climate)
                                    .font(Theme.typography.body1)
                                    .foregroundColor(Theme.colors.text)
                            }
                            Spacer()
                        }
                        
                        HStack(spacing: 12) {
                            Image("ic_terrain")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            HStack(spacing: 8)  {
                                Text("Terrain:")
                                    .font(Theme.typography.body2)
                                    .foregroundColor(Theme.colors.text)
                                Text(planet.terrain)
                                    .font(Theme.typography.body1)
                                    .foregroundColor(Theme.colors.text)
                            }
                            Spacer()
                        }
                        
                        HStack(spacing: 12) {
                            Image("ic_population")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            HStack(spacing: 8)  {
                                Text("Population:")
                                    .font(Theme.typography.body2)
                                    .foregroundColor(Theme.colors.text)
                                Text(planet.population)
                                    .font(Theme.typography.body1)
                                    .foregroundColor(Theme.colors.text)
                            }
                            Spacer()
                        }
                        
                        HStack(spacing: 12) {
                            Image("ic_gravity")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            HStack(spacing: 8)  {
                                Text("Gravity:")
                                    .font(Theme.typography.body2)
                                    .foregroundColor(Theme.colors.text)
                                Text(planet.gravity)
                                    .font(Theme.typography.body1)
                                    .foregroundColor(Theme.colors.text)
                            }
                            Spacer()
                        }
                    }.padding(.all, 24)
                    
                    Button(action: { onReadMoreClicked() }) {
                        HStack {
                            Spacer()
                            Text("Read More")
                                .foregroundColor(.black)
                                .font(Theme.typography.body2)
                            Spacer()
                        }
                    }
                    .frame(minHeight: 49)
                    .background(
                        Theme.colors.accent,
                        in: RoundedRectangle(cornerRadius: 40)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                .background(
                    Theme.colors.background4,
                    in: RoundedRectangle(cornerRadius: 41)
                )
                .padding(.vertical, 1)
                .padding(.horizontal, 2)
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
                    .font(Theme.typography.title1)
                    .foregroundColor(Theme.colors.text)
                    .padding(.all, 8)
                
                ForEach(items, id: \.self) { item in
                    Button(action: { onFilmItemClick(item) }) {
                        HStack {
                            
                            Image(item.thumbnail)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 96, height: 100)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text(item.title)
                                    .font(Theme.typography.title2)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(1)
                                    .foregroundColor(Theme.colors.text)
                                Text(item.openingCrawl)
                                    .font(Theme.typography.subtitle1)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .foregroundColor(Theme.colors.text)
                                HStack {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Theme.colors.accent)
                                        .frame(width: 20, height: 20)
                                    Text(item.rating)
                                        .font(Theme.typography.subtitle1)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Theme.colors.text)
                                }
                                .padding(.vertical, 6)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Theme.colors.strokeLight)
                        }
                    }
                }
                
                Button(action: { onViewAllFilms() }) {
                    HStack {
                        Spacer()
                        Text("View all films")
                            .font(Theme.typography.body2)
                            .foregroundColor(Theme.colors.background2)
                        Spacer()
                    }
                }
                .frame(minHeight: 49)
                .background(
                    Theme.colors.accent,
                    in: RoundedRectangle(cornerRadius: 40)
                )
                .padding(.top, 24)
            }.padding()
        }
        .background(
            Theme.colors.background2,
            in: RoundedRectangle(cornerRadius: 41)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(repository: Navigator.getRepositoryForPreview())
    }
}
