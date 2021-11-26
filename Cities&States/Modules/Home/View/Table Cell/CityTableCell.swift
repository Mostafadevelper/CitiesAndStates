//
//  CityTableCell.swift
//  Cities&States
//
//  Created by Mostafa on 26/11/2021.
//

import UIKit

class CityTableCell: UITableViewCell {

    //MARK:- Layout:
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var arrowIMG: UIImageView!
    
    //MARK:- Variable:-
    var listCellViewModel: HomeCellVM? {
        didSet { self.setup() }
    }
    
    //MARK:- Life Cycle:-
    override func awakeFromNib() {
        super.awakeFromNib()
        setupFonts()
    }
    
    fileprivate func setupFonts(){
        self.titleLB.font = UIFont.fonts(name: .demiBold, size: .size_xl)
    }

}

//MARK:- Load Data:-
extension CityTableCell {
    
    //MARK:- Setup & Load Data
    fileprivate func setup() {
        self.titleLB.text = listCellViewModel?.cityName
        self.arrowIMG.image = self.listCellViewModel!.isOpen ? UIImage(named: "bottom") : UIImage(named: "right")
    }
    
}
