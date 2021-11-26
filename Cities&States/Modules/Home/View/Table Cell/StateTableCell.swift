//
//  StateTableCell.swift
//  Cities&States
//
//  Created by Mostafa on 26/11/2021.
//

import UIKit

class StateTableCell: UITableViewCell {

    //MARK:- Layout:-
    @IBOutlet weak var stateNameLB: UILabel!
    
    //MARK:- Variable:-
    var listCellViewModel: State? {
        didSet { self.setup() }
    }

    //MARK:- Life Cycle:-
    override func awakeFromNib() {
        super.awakeFromNib()
        setupFonts()
    }
    
    fileprivate func setupFonts(){
        self.stateNameLB.font = UIFont.fonts(name: .regular, size: .size_l)
    }

    
}

//MARK:- Load Data:-
extension StateTableCell {
    
    //MARK:- Setup & Load Data
   fileprivate func setup(){
       self.stateNameLB.text = "- \(listCellViewModel?.title ?? "")"
    }
    
}
