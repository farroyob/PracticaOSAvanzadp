//
//  HeroesRowView.swift
//  PracticaIOSAvanzado (iOS)
//
//  Created by Freddy A. on 9/26/21.
//

import SwiftUI


struct HeroesRowView: View {
    @ObservedObject private var viewModel = PhotoViewModel()
    
    var hero: Result //nos lo pasa la padre
    
    
    var body: some View {
        VStack{
            ZStack{
                //si hay foto
                if let photo = viewModel.photo {
                    photo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding([.leading, .trailing],20)
                        .opacity(0.6)
                    
                } else {
                    
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding([.leading, .trailing],20)
                        .opacity(0.6)
                }
                
                Text("\(hero.name)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                    .bold()
            }
        }
        .onAppear{
            viewModel.loadImage(url: hero.thumbnail.path)
        }
    }
}
/*
struct HeroesRowView_Previews: PreviewProvider {
    static var previews: some View {
        let currentDateTime = Date()
        
        let comicItem1: ComicsItem = ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/27624", name: "Agents of Atlas (2019)")
        let comicItem2: ComicsItem = ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/29600", name: "Atlantis Attacks (2020)")
        let comicItem3: ComicsItem = ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/31376", name: "King In Black: Black Knight (2021)")
        let comicItem4: ComicsItem = ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/27779", name: "Sword Master (2019 - 2020)")
        let comicItem5: ComicsItem = ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/27408", name: "Sword Master Vol. 2: God Of War (2021)")
        
        let items: [ComicsItem] = [comicItem1, comicItem2, comicItem3, comicItem4, comicItem5]
        
        let comics: Comics = Comics(available: 5, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017852/series", items: items, returned: 5)
        
        let thumbnail: Thumbnail = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: Extension.jpg)
        
        let hero: Result = Result(id: 123, name: "word Master (Sword Master)", resultDescription: "description", modified: currentDateTime, thumbnail: thumbnail, resourceURI: "", series: comics)
        
        HeroesRowView(hero: hero)
        
        
    }
}
 */
