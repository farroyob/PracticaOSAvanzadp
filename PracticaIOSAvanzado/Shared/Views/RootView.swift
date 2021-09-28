//
//  RootView.swift
//  PracticaIOSAvanzado (iOS)
//
//  Created by Freddy A. on 9/26/21.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        switch rootViewModel.status {
            case Status.loading:
                Text("Por favor, espere...")
            case Status.loaded:
                HeroesView(viewModel: ViewModelHeros())
            case Status.register:
                Text("Register View")
            case Status.error(error: let errorString):
                Text("Error: \(errorString)")
            case .none:
                HeroesView(viewModel: ViewModelHeros())
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
