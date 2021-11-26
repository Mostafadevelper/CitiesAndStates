//
//  CityApi.swift
//  Cities&States
//
//  Created by Mostafa on 26/11/2021.
//

import Alamofire
import PromiseKit

class CityApi: Api {
    
    enum APIRouter: Requestable {
        
        case getCities(CityApi)
        
        var baseUrl: URL {
            return URL(string: "https://app.findq8.tocaanme.com/api")!
        }
        
        var path: String {
            switch self {
            case .getCities:
                return "/areas/cities"
            }
        }
        var method: HTTPMethod {
            switch self {
            case .getCities:
                return .get
            }
        }
        
        var isWWWFormUrlEncoded: Bool? {
            return true
        }
        
    }
}



extension CityApi {
    
    func getCityList( ) -> Promise<CitiesResponse> {
        return fireRequestWithSingleResponse(requestable: APIRouter.getCities(self))
    }
    
}
