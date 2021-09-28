//
//  RootViewModel.swift
//  PracticaIOSAvanzado (iOS)
//
//  Created by Freddy A. on 9/26/21.
//

import Foundation

import Foundation
import Combine


public let CONST_TOKEN_ID = "tokenJWTKeyChainAppKeepCodingBoot12"

class RootViewModel: ObservableObject {
    @Published var status = Status.none //Estado de las llamadas de red
        
    var suscriptors = Set<AnyCancellable>()
    
    init(){
        status = .none
    }
    
     
    
}
