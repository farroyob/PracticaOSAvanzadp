//
//  HeroesDetailView.swift
//  PracticaIOSAvanzado (iOS)
//
//  Created by Freddy A. on 9/26/21.
//

import SwiftUI

struct HeroesDetailView: View {
    var hero : Result
    @ObservedObject private var viewModel = PhotoViewModel()
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                if let photo = viewModel.photo {
                    photo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding([.leading, .trailing],20)
                        .opacity(0.8)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding([.leading, .trailing],20)
                        .opacity(0.8)
                    
                    
                }
                
                //description
                Text("\(hero.resultDescription)")
                    .foregroundColor(.gray)
                    .font(.caption2)
                
            }
            .onAppear{
                if let _ = viewModel.photo{} else {
                    viewModel.loadImage(url: hero.thumbnail.path)
                }
            }
            .navigationBarTitle(hero.name)
        }
    }
}
/*
struct HeroesDetailView_Previews: PreviewProvider {
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
                
        HeroesDetailView(hero: hero)
    }
}
*/
