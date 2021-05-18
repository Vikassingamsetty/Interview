//
//  popUpVC.swift
//  DXMindsTask
//
//  Created by apple on 18/05/21.
//

import UIKit

class popUpVC: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    var userPic = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.cornerRadius = 12
        
        Indicator.shared().showIndicator(withTitle: "", and: "Loading...", vc: mainView)
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.userImage.downloaded(from: self.userPic, contentMode: .scaleToFill)
            Indicator.shared().hideIndicator(vc: self.mainView)
        }
        
    }

    @IBAction func onTapCancel() {
        dismiss(animated: true, completion: nil)
    }
    
}
