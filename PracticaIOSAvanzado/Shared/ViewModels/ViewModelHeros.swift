//
//  ViewModelHeros.swift
//  PracticaIOSAvanzado (iOS)
//
//  Created by Freddy A. on 9/26/21.
//

import Foundation
import Combine

class ViewModelHeros: ObservableObject{
    @Published var heroes: [Result]?
    @Published var status = Status.none
    var suscriptors = Set<AnyCancellable>()
    var mainData: Heroes?
    
    
    init(testing:Bool = false){
        if (testing){
            getHerosTesting()
        } else{
            getHeros()
        }
    }
    
    func getHeros(){
        self.status = Status.loading
        
        guard let urlRequest = BaseNetwork().getSessionHeros() else {
            return
        }
        
        URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                //el JSON
                print($0.response)
               print($0.data)
                return  $0.data
            }
            .decode(type: Heroes.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                    case .failure:
                        self.status = Status.error(error: "Error al buscar los héroes")
                    case .finished:
                        self.status = Status.loaded
                }
            } receiveValue: { data in
                self.heroes = data.data.results
            }
            .store(in: &suscriptors)
        
        
    }
    
    // Testing y Diseño
    func getHerosTesting(){
        self.status = Status.loading
        /*
        let currentDateTime = Date()
        
        let comicItem1: ComicsItem = ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/27624", name: "Agents of Atlas (2019)")
        let comicItem2: ComicsItem = ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/29600", name: "Atlantis Attacks (2020)")
        let comicItem3: ComicsItem = ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/31376", name: "King In Black: Black Knight (2021)")
        let comicItem4: ComicsItem = ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/27779", name: "Sword Master (2019 - 2020)")
        let comicItem5: ComicsItem = ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/27408", name: "Sword Master Vol. 2: God Of War (2021)")
        
        let items: [ComicsItem] = [comicItem1, comicItem2, comicItem3, comicItem4, comicItem5]
        
        let comics: Comics = Comics(available: 5, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017852/series", items: items, returned: 5)
        
        let thumbnail: Thumbnail = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: Extension.jpg)
        
        let result: Result = Result(id: 123, name: "word Master (Sword Master)", resultDescription: "description", modified: currentDateTime, thumbnail: thumbnail, resourceURI: "", series: comics)
        
        let resultDetail: [Result] = [result]
        
        //let data: DataClass = DataClass(results: resultDetail)
        
        //let herosInfo: Heros = Heros(status: "200", copyright: "© 2021 MARVEL", data: data)
        
        self.heroes = resultDetail
        
        self.status = Status.loaded
        */
    }
    
}
