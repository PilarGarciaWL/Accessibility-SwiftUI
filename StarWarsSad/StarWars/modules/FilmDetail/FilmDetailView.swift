//
//  FilmDetailView.swift
//  StarWarsSad
//
//  Created by Pilar García on 25/3/23.
//

import SwiftUI

struct FilmDetailView: View {
    
    @StateObject private var viewModel : FilmDetailViewModel
    
    init(film: Film, repository: RepositoryProtocol) {
        _viewModel = StateObject(
            wrappedValue: FilmDetailViewModel(
                film: film,
                repository: repository
            )
        )
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                VStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(
                            width: UIScreen.main.bounds.size.width-48,
                            height: UIScreen.main.bounds.size.width-48
                        )
                        .foregroundColor(.yellow)
                        .overlay{
                            Text("Image")
                        }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Espisode \(viewModel.film.episodeID)")
                            .bold()
                            .multilineTextAlignment(.leading)
                        Text(viewModel.film.openingCrawl)
                        Text("Director: \(viewModel.film.director)")
                        Text("Producer: \(viewModel.film.producer)")
                        Text("Release date: \(viewModel.film.releaseDate)")
                    }
                    .padding(8)
                }
                
                VStack(alignment: .leading) {
                    Text("Characters")
                        .bold()
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.characters, id: \.self) { character in
                                VStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(
                                            width: 100,
                                            height: 100
                                        )
                                        .foregroundColor(.yellow)
                                        .overlay{
                                            Text("Image")
                                        }
                                    Text(character.name)
                                }
                            }
                            
                        }
                    }
                }
                
            }.padding(.all, 24)
        }
        .navigationTitle(viewModel.film.title)
        .accentColor(.black)
    }
}

struct FilmDetailView_Previews: PreviewProvider {
    
    @State static var film = Film(
        title: "A New Hope",
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
        image: "img_4"
    )
    
    static var previews: some View {
        FilmDetailView(film: film, repository: Navigator.getRepositoryForPreview())
    }
}
