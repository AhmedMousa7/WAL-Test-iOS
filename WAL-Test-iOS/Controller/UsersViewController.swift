//
//  ViewController.swift
//  WAL-Test-iOS
//
//  Created by Ahmed Mousa on 09/01/2021.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    
    private var usersManager = UsersManager()
    private var users: [UserUiModel] = []
    private var selectedUser: UserUiModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.dataSource = self
        usersTableView.delegate = self
        usersTableView.register(UINib(nibName: K.NibFileName, bundle: nil), forCellReuseIdentifier: K.ReuseableCell)
        
        usersManager.delgate = self
        usersManager.fetchUsersList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsController = segue.destination as? UserProfileViewController {
            detailsController.selectedUser = selectedUser
        }
    }
    
}

//MARK: - add section comment

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.ReuseableCell) as! UserViewCell
        let cellIndex = indexPath.row
        cell.userImage.image = nil
        cell.userNameLabel.text = users[cellIndex].name
        if let profileImageUrl = users[cellIndex].imageUrl {
            cell.userImage.load(url: profileImageUrl)
        }
        
        return cell
    }
    
}

//MARK: - UITableViewDelgate

extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedUser = users[indexPath.row]
        self.performSegue(withIdentifier: "listToDetails", sender: self)
    }
    
}

//MARK: - UsersManagerDelgate

extension UsersViewController: UsersManagerDelgate {
    
    func usersListDidFetch(list: [UserUiModel]) {
        self.users = list
        DispatchQueue.main.async {
            self.usersTableView.reloadData()
        }
    }
    
}
