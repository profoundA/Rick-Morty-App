//
//  Networking.swift
//  Rick & Morty app
//
//  Created by Andrey Lobanov on 16.08.2021.
//

import Foundation
import Alamofire


class Networking {
    
    
    func loadCharacters(completition: @escaping ([Result]) -> Void) {
        
        
        AF.request("https://rickandmortyapi.com/api/character").responseDecodable(of: Character.self) { response in
            guard let character = response.value else { return }
            DispatchQueue.main.async {
                completition(character.results)
            }
            
        }
    }
    
    
}
