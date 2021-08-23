//
//  Characters.swift
//  Rick & Morty app
//
//  Created by Andrey Lobanov on 16.08.2021.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let character = try? newJSONDecoder().decode(Character.self, from: jsonData)

import Foundation


struct Character: Codable {
    let info: Info
    let results: [Result]
}

struct Info: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

struct Result: Codable {
    let id: Int?
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: String?
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Codable {
    let name: String
    let url: String
}


enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}


