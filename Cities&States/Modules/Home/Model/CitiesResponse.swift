//
//  CitiesResponse.swift
//  Cities&States
//
//  Created by Mostafa on 26/11/2021.
//

import Foundation


struct CitiesResponse: Codable {
    
    let data : [CityDatum]?
    let message : String?
    let success : Bool?

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case message = "message"
        case success = "success"
    }
    
}


struct CityDatum : Codable {
    
    let id : Int?
    let states : [State]?
    let title : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case states = "states"
        case title = "title"
    }
}


struct State : Codable {
    
    let cityId : Int?
    let id : Int?
    let title : String?
    
    enum CodingKeys: String, CodingKey {
        case cityId = "city_id"
        case id = "id"
        case title = "title"
    }
}
