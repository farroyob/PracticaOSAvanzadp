//
//  HeroesView.swift
//  PracticaIOSAvanzado (iOS)
//
//  Created by Freddy A. on 9/26/21.
//

import SwiftUI

struct HeroesView: View {
    @StateObject var viewModel : ViewModelHeros
    
    var body: some View {
        VStack {
            NavigationView{
                
                
                List{
                    if let heros = viewModel.heroes{
                        ForEach(heros){ data in
                            NavigationLink(
                                destination: HeroesDetailView(hero: data),
                                label: {
                                    //Row del heroe
                                    HeroesRowView(hero: data)
                                })
                        }
                    }
                }
                .navigationBarTitle("Lista de Heroes",  displayMode: .large)
            }
        }
        
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView(viewModel: ViewModelHeros(testing: true))
    }
}
