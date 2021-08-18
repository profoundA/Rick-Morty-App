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
    let next: String
    let prev: String?
}

struct Result: Codable {
    let id: Int?
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}


