//
//  UserListTVCell.swift
//  DXMindsTask
//
//  Created by apple on 18/05/21.
//

import UIKit

protocol UserSettingsProtocol {
    func settingsTapped(_ value: String)
}

class UserListTVCell: UITableViewCell {

    static var identifier: String {
        return "\(self)"
    }
    
    static func nib() -> UINib {
        return UINib(nibName: UserListTVCell.identifier, bundle: nil)
    }
    
    @IBOutlet weak var dynamicColorView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailIDLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    
    var delegate: UserSettingsProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dynamicColorView.backgroundColor = .randomColor()
        
    }
    
    func setupDetails(index: Int) {
        
        let details = DataStorage.shared
        
        nameLabel.text = "\(details.firstName?[index] ?? "") \(details.lastName?[index] ?? "")"
        emailIDLabel.text = details.emailID?[index] ?? ""
        settingsButton.tag = index
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func onTapSettingsButton(_ sender: UIButton) {
        delegate?.settingsTapped(DataStorage.shared.userImage?[sender.tag] ?? "")
    }
    
}
