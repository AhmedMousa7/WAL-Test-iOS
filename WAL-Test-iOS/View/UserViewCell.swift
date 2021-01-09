//
//  UserViewCell.swift
//  WAL-Test-iOS
//
//  Created by Ahmed Mousa on 09/01/2021.
//

import UIKit

class UserViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var container: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        container.layer.cornerRadius = 8
        userImage.layer.cornerRadius = userImage.frame.width / 2
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
