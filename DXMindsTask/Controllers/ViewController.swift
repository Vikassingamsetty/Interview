//
//  ViewController.swift
//  DXMindsTask
//
//  Created by apple on 18/05/21.
//

import UIKit

class ViewController: UIViewController {

    fileprivate lazy var userListTV: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UserListTVCell.nib(), forCellReuseIdentifier: UserListTVCell.identifier)
        return tableView
    }()
    
    //Instance for Model
    var userListModel: UserListModel?
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User List"
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userList()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        userListTV.frame = view.bounds
        view.addSubview(userListTV)
    }
    
    //MARK:- Selector
    func setupTableView() {
        userListTV.delegate = self
        userListTV.dataSource = self
        userListTV.separatorStyle = .none
    }
    
}

//MARK:- API Data saving to singletone class from model
extension ViewController {
    func saveToSingletone() {
        DataStorage.shared.firstName = userListModel?.data.map{$0.firstName ?? ""}
        DataStorage.shared.lastName = userListModel?.data.map{$0.lastName ?? ""}
        DataStorage.shared.emailID = userListModel?.data.map{$0.email ?? ""}
        DataStorage.shared.userImage = userListModel?.data.map{$0.avatar ?? ""}
        
        DispatchQueue.main.async {
            self.userListTV.reloadData()
        }
        
    }
}

//MARK:- TableView Delegates & Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStorage.shared.firstName?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userCell = userListTV.dequeueReusableCell(withIdentifier: UserListTVCell.identifier, for: indexPath) as? UserListTVCell else {return UITableViewCell()}
        userCell.setupDetails(index: indexPath.row)
        userCell.delegate = self
        return userCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
