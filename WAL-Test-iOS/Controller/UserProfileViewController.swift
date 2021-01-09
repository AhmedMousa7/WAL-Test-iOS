//
//  UserProfileViewController.swift
//  WAL-Test-iOS
//
//  Created by Ahmed Mousa on 09/01/2021.
//

import UIKit

class UserProfileViewController: UIViewController {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameStack: UIStackView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileStack: UIStackView!
    @IBOutlet weak var userProfileLabel: UILabel!
    
    var selectedUser: UserUiModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameStack.layer.cornerRadius = 8
        profileStack.layer.cornerRadius = 8
        if let user = selectedUser {
            if let profileImageUrl = user.imageUrl {
                userImageView.layer.cornerRadius = userImageView.frame.width / 2
                userImageView.load(url: profileImageUrl)
            }
            userNameLabel.text = user.name
            userProfileLabel.text = user.profileUrl
        }
    }
    
}
