//
//  SearchBarExampleController.swift
//  ParallaxSectionExample
//
//  Created by Hubilo Softech Private Limited on 15/10/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

class SearchBarExampleController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private lazy var searchController:UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search your stuffs here"
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.separatorColor = tableView.backgroundColor
        navigationItem.searchController = searchController
        definesPresentationContext = true
        title = "Search bar example"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}


extension SearchBarExampleController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CardTableViewCell
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
        cell.type = (numberOfRows == 1) ? .single : indexPath.row == 0 ? .top : (indexPath.row == (numberOfRows-1)) ? .bottom : .middle
        cell.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = tableView.backgroundColor
        return cell
    }
}

extension SearchBarExampleController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
     //update your results
    }
}
