//
//  PhotoViewModel.swift
//  PracticaIOSAvanzado (iOS)
//
//  Created by Freddy A. on 9/26/21.
//

import Foundation
import Combine
import SwiftUI

class PhotoViewModel:ObservableObject {
    @Published var photo:Image? //aqui la foto
    
    var suscriptor = Set<AnyCancellable>()
    
    func loadImage(url:String){
        //Control de caches....
        
        let urlDownload = URL(string: url)!
        
        URLSession.shared
            .dataTaskPublisher(for: urlDownload)
            .map{
                UIImage(data: $0.data)
            }
            .map{ image -> Image in
                Image(uiImage: image!)
            }
            .replaceError(with: Image(systemName: "person.fill"))
            .replaceNil(with: Image(systemName: "person.fill"))
            .receive(on: DispatchQueue.main)
            .sink { image in
                self.photo = image //$0
            }
            .store(in: &suscriptor)
        
        
    }
    
}
