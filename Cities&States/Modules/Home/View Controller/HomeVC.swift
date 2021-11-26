//
//  HomeVC.swift
//  Cities&States
//
//  Created by Mostafa on 26/11/2021.
//

import UIKit

class HomeVC: BaseVC {
    
    //MARK:- Layout:-
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLB: UILabel!
    
    //MARK:- Variable & Constants:
    lazy var viewModel: HomeVM  = {
        return HomeVM()
    }()
    let refreshControl = UIRefreshControl()
    
    //MARK:- Life Cycle:-
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFonts()
        setupTableView()
        setupViewModel()
        viewModel.fetchData()
    }
    
    fileprivate func loadFonts(){
        self.titleLB.font = UIFont.fonts(name: .bold, size: .size_2xl)
    }
    
    //MARK:- Tp Refresh Update
    @objc func refresh(){
        viewModel.isFetch = true
        viewModel.fetchData()
    }
    
}

//MARK:- Setup View Model
extension HomeVC {
    
    func setupViewModel() {
        
        viewModel.error = { [weak self] error in
            guard !error.isEmpty else { return }
            self?.showAlert("error", error)
        }
        viewModel.loading = { isLoading in
            guard isLoading else{
                self.hideLoadingAnimation()
                return
            }
            self.showLoadingAnimation()
        }
        viewModel.isRefresh = { [weak self] (isRefresh) in
            guard isRefresh else {
                self?.refreshControl.endRefreshing()
                return
            }
        }
        viewModel.citiesList = { [weak self] list in
            guard !list.isEmpty else {
                self?.showEmptyAnimation()
                return }
            self?.hideLoadingAnimation()
            self?.tableView.reloadData()
        }
    }
}

//MARK:- TableView DataSourse
extension HomeVC: UITableViewDataSource {
    
    fileprivate func setupTableView(){
        
        let attributes = [NSAttributedString.Key.foregroundColor: Colors.secondary.color, NSAttributedString.Key.font: UIFont.fonts(name: .regular, size: .size_m) ]
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh", attributes: attributes)
        refreshControl.tintColor = Colors.secondary.color
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
        self.tableView.register(cell: CityTableCell.self)
        self.tableView.register(cell: StateTableCell.self)
        self.tableView.tableFooterView = UIView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModel.cellViewModels[section].isOpen ? ( viewModel.cellViewModels[section].stateList.count + 1 ) : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeue() as CityTableCell
            cell.listCellViewModel = viewModel.cellViewModels[indexPath.section]
            return cell
        } else {
            let cell = tableView.dequeue() as StateTableCell
            cell.listCellViewModel = viewModel.cellViewModels[indexPath.section].stateList[indexPath.row - 1]
            return cell
        }
    }
    
}

//MARK:- TableView Delegate
extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.viewModel.heightForCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            viewModel.openCloseCell(at: indexPath)
            self.tableView.reloadSections([indexPath.section], with: .automatic)
        }
    }
}

