//
//  Networking.swift
//  Rick & Morty app
//
//  Created by Andrey Lobanov on 16.08.2021.
//

import Foundation
import Alamofire

protocol EpisodesDelegate {
    
    func episodesTableUpdate(name: String, episodeNumber: String)
}

class Networking {
    
    func loadCharacters(completition: @escaping ([Result], Info) -> Void) {
        
        AF.request("https://rickandmortyapi.com/api/character/?page=1").responseDecodable(of: Character.self) { response in
            guard let character = response.value else { return }
            
            completition(character.results, character.info)
        }
    }
    
    func infiniteScroll(url: String, completion: @escaping ([Result], Info) -> Void) {
        
        let url = url
        
        AF.request(url).responseDecodable(of: Character.self) { response in
            print(response)
            guard let character = response.value else { return }
            
            completion(character.results, character.info)
        }
    }
}

class EpisodesNetworking {
    
    var episodeDelegate: EpisodesDelegate?
    
    func loadEpisodes(url: String) {
        
        let url = url
        
        AF.request(url).responseDecodable(of: Episode.self) { response in
            print(response)
            guard let episode = response.value else { return }
            self.episodeDelegate?.episodesTableUpdate(name: episode.name, episodeNumber: episode.episode)
        }
    }
}
