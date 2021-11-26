//
//  CiteiesVM.swift
//  Cities&States
//
//  Created by Mostafa on 26/11/2021.
//

import Foundation
import UIKit

class HomeVM {
    
    //MARK:- Variable:-
    private var cityApi = CityApi()
    private var citeis: [CityDatum] = [CityDatum]()
    var cellViewModels: [HomeCellVM] = [HomeCellVM]()
    var citiesList :(([HomeCellVM])->())!
    var loading :((Bool) ->())!
    var error: ((String)-> ())!
    var isFetch = false
    var isRefresh: ((Bool) -> ())!
    
}

//MARK:- Setup Data Frome Network
extension HomeVM {
    
    //MARK:- NetWork
    func fetchData(){
        if !isFetch { self.loading?(true) }
        
        cityApi.getCityList().get { [weak self] responseData in
            guard let self = self else { return }
            self.loading(false)
            self.isRefresh(false)
            self.isFetch = false
            self.processFetchedCityResult(result: responseData.data ?? [])
        }.catch { [weak self] error in
            guard let self = self else { return }
            self.loading(false)
            self.isRefresh(false)
            self.error(error.localizedDescription)
        }
    }
    
    
    //MARK:- Setup  Cell View Model
    private func processFetchedCityResult(result : [CityDatum]) {
        self.citeis = result
        var list = [HomeCellVM]()
        for city in citeis {
            list.append(createCityCellViewModel(at: city))
        }
        self.cellViewModels = list
        
        self.citiesList(self.cellViewModels)
    }
    
    //MARK:- Create Cell View Model
    private func createCityCellViewModel(at result: CityDatum) -> HomeCellVM {
        
        HomeCellVM(cityName: result.title ?? "", stateList: result.states ?? [])
    }
        
}


extension HomeVM {
    
    //MARK:- To assign hieght of cell
    func heightForCell(at indexPath: IndexPath) -> CGFloat {
        indexPath.row == 0 ? 60 : 35
    }
    
    //MARK:- To open state cell
    func openCloseCell(at indexPath: IndexPath) {
        self.cellViewModels[indexPath.section].isOpen = !self.cellViewModels[indexPath.section].isOpen
    }
}
