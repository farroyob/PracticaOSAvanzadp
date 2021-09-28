//
//  KeyChain.swift
//  PracticaIOSAvanzado (iOS)
//
//  Created by Freddy A. on 9/26/21.
//

import Foundation
import KeychainSwift

@discardableResult func saveKC(key:String, value:String ) -> Bool {
    
    if let data = value.data(using: .utf8){
        let keyChain = KeychainSwift()
        keyChain.set(data, forKey: key)
        return true
    } else {
        return false
    }
}

func loadKC(key:String) -> String? {
    let keychain = KeychainSwift()
    if let data = keychain.get(key) {
        return data
    } else {
        return ""
    }
}

func deleteKC(key:String){
    let keychain = KeychainSwift()
    keychain.delete(key)
}
