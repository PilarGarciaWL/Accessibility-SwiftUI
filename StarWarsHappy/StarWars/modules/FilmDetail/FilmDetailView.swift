//
//  FilmDetailView.swift
//  StarWarsSad
//
//  Created by Pilar García on 25/3/23.
//

import SwiftUI

struct FilmDetailView: View {
    
    @StateObject private var viewModel : FilmDetailViewModel
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    init(film: Film, chronology: [Film], repository: RepositoryProtocol) {
        _viewModel = StateObject(
            wrappedValue: FilmDetailViewModel(
                film: film,
                chronology: chronology,
                repository: repository
            )
        )
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                VStack(alignment: .leading) {
                    Image(viewModel.film.image)
                        .resizable()
                        .scaledToFit()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Theme.colors.accent)
                                .frame(width: 20, height: 20)
                            Text(viewModel.film.rating)
                                .font(Theme.typography.subtitle1)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Theme.colors.text)
                        }
                        Text(viewModel.film.completeTitle)
                            .font(Theme.typography.title1)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Theme.colors.text)
                        Text(viewModel.film.openingCrawl)
                            .font(Theme.typography.body1)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Theme.colors.text)
                    }
                    .padding(8)
                    
                    VStack(spacing: 16) {
                        HStack(spacing: 8) {
                            Image("ic_director")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .padding(.trailing, 8)
                            Text("Director:")
                                .font(Theme.typography.body2)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Theme.colors.text)
                            Text(viewModel.film.director)
                                .font(Theme.typography.body1)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Theme.colors.text)
                            Spacer()
                        }
                        
                        HStack(spacing: 8) {
                            Image("ic_producer")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .padding(.trailing, 8)
                            Text("Producer:")
                                .font(Theme.typography.body2)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Theme.colors.text)
                            Text(viewModel.film.producer)
                                .font(Theme.typography.body1)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Theme.colors.text)
                            Spacer()
                        }
                        
                        HStack(spacing: 8) {
                            Image("ic_release")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .padding(.trailing, 8)
                            Text("Release:")
                                .font(Theme.typography.body2)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Theme.colors.text)
                            Text(viewModel.film.releaseDate)
                                .font(Theme.typography.body1)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Theme.colors.text)
                            Spacer()
                        }
                    }
                    .padding(24)
                    .background(
                        Theme.colors.background4,
                        in: RoundedRectangle(cornerRadius: 40)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Theme.colors.strokeLight, lineWidth: 1)
                    )
                    .padding(1)
                }.padding(.all, 16)
                
                VStack(alignment: .leading) {
                    Text("Next on the chronology:")
                        .font(Theme.typography.title2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Theme.colors.text)
                        .padding(.horizontal, 28)
                    
                    HStack(alignment: .top) {
                        ForEach(viewModel.chronology, id: \.self) { item in
                            VStack(alignment: .center) {
                                Image(item.thumbnail)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 96, height: 100)
                                
                                Text(item.title)
                                    .font(Theme.typography.title2)
                                    .multilineTextAlignment(.center)
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
                            }
                        }
                        
                        Spacer()
                    }.padding(.all, 16)
                }
                .padding(.vertical, 24)
                .edgesIgnoringSafeArea(.bottom)
                .background(
                    Theme.colors.background4,
                    in: RoundedRectangle(cornerRadius: 40)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Theme.colors.strokeLight, lineWidth: 1)
                )
                .padding(.all, -1)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Theme.colors.background1)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                HStack {
                    Button(
                        action : { self.presentation.wrappedValue.dismiss() }) {
                            Image(systemName: "arrow.left")
                                .frame(width: 48, height: 48)
                                .background(Theme.colors.background4)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Theme.colors.strokeLight, lineWidth: 1)
                                )
                        }
                        .foregroundColor(Theme.colors.text)
                        .padding(.vertical, 8)
                    Text(viewModel.film.title)
                        .font(Theme.typography.title1)
                        .foregroundColor(Theme.colors.text)
                }
            
        )
    }
}

struct FilmDetailView_Previews: PreviewProvider {
    
    @State static var film = Film(
        title: "A New Hope",
        completeTitle: "Episode IV: A New Hope",
        episodeID: 4,
        openingCrawl: "It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire\'s\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire\'s\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....",
        director: "George Lucas",
        producer: "Gary Kurtz, Rick McCallum",
        releaseDate: "1977-05-25",
        species: [
            "https://swapi.dev/api/species/1/",
            "https://swapi.dev/api/species/2/",
            "https://swapi.dev/api/species/3/",
            "https://swapi.dev/api/species/4/",
            "https://swapi.dev/api/species/5/"],
        starships: [
            "https://swapi.dev/api/starships/2/",
            "https://swapi.dev/api/starships/3/",
            "https://swapi.dev/api/starships/5/",
            "https://swapi.dev/api/starships/9/",
            "https://swapi.dev/api/starships/10/",
            "https://swapi.dev/api/starships/11/",
            "https://swapi.dev/api/starships/12/",
            "https://swapi.dev/api/starships/13/"
        ],
        vehicles: [
            "https://swapi.dev/api/vehicles/4/",
            "https://swapi.dev/api/vehicles/6/",
            "https://swapi.dev/api/vehicles/7/",
            "https://swapi.dev/api/vehicles/8/"
        ],
        characters: [
            "https://swapi.dev/api/people/1/",
            "https://swapi.dev/api/people/2/",
            "https://swapi.dev/api/people/3/",
            "https://swapi.dev/api/people/4/",
            "https://swapi.dev/api/people/5/",
            "https://swapi.dev/api/people/6/",
            "https://swapi.dev/api/people/7/",
            "https://swapi.dev/api/people/8/",
            "https://swapi.dev/api/people/9/"
        ],
        planets: [
            "https://swapi.dev/api/planets/1/",
            "https://swapi.dev/api/planets/2/",
            "https://swapi.dev/api/planets/3/"
        ],
        rating: "8.6",
        thumbnail: "img_4",
        image: "img_4-big"
    )
    
    static var previews: some View {
        FilmDetailView(
            film: film,
            chronology: [],
            repository: Navigator.getRepositoryForPreview()
        )
    }
}
