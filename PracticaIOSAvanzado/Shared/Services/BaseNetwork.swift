//
//  BaseNetwork.swift
//  PracticaIOSAvanzado (iOS)
//
//  Created by Freddy A. on 9/26/21.
//

import Foundation

let server = "https://gateway.marvel.com"
let paramApiKey = "30430a1ed52e732677a8c2032b2defb2"
let paramTs = "1"
let paramHash = "6b836c46da4a4b79c81802ba1eb5a950"
let paramOrderBy = "-modified"

struct HTTPMethods{
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum endpoints : String {
    case herosList = "/v1/public/characters"
}

struct BaseNetwork{
     func getSessionHeros() -> URLRequest? {
        //let urlCad :String = "\(server)\(endpoints.herosList.rawValue)?apikey=\(paramApiKey)&ts=\(paramTs)&hash=\(paramHash)&orderBy=\(paramOrderBy)"
        let urlCad :String = "https://gateway.marvel.com/v1/public/characters?apikey=30430a1ed52e732677a8c2032b2defb2&ts=1&hash=6b836c46da4a4b79c81802ba1eb5a950&orderBy=-modified"
        
        guard let urlServer = URL(string: urlCad) else {
            return nil
        }
        
        //Creamos el request
        var request :URLRequest = URLRequest(url: urlServer)//se deberia desempaquetar
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
               
        return request
    }
}
