//
//  ApiNetwork.swift
//  IMC Calculator
//
//  Created by Samuel Leal Vega on 24/06/26.
//

import Foundation

class ApiNetwork{
    
    struct Wrapper:Codable{
        let response: String
        let results:[Superhero]
    }
    
    struct Superhero: Codable{
        let id: String
        let name: String
    }
    
    func getHeroesByQuery(query: String) async throws -> Wrapper{
        let url = URL(string: "https://superheroapi.com/api/0a1fa8f065b52d22c5e0d3cdd9805f61/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper
    }
    
}
