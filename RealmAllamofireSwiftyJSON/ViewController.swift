//
//  ViewController.swift
//  RealmAllamofireSwiftyJSON
//
//  Created by Denis on 22.03.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let tableView = UITableView()
    private let cellId = "cell"
    private var commets: [Comment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView()
        configureTableview()
        getComments()
    }
    
    private func getComments () {
        DataProvider.shared.fetchComments { [weak self] _commets in
            guard let self = self else {return}
            self.commets = _commets
            self.tableView.reloadData()
        }
    }
    
    private func addTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func configureTableview() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commets.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = commets[indexPath.row].name
        print (commets[indexPath.row].name)
        return cell
    }
    
    
}

