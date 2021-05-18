//
//  Indicator.swift
//  MyFishingBoat
//
//  Created by Appcare Apple on 29/07/20.
//  Copyright © 2020 Anil. All rights reserved.
//

import Foundation
import MBProgressHUD

class Indicator:UIViewController {
    
    class func shared() -> Indicator {
        struct Static {
            static let manager = Indicator()
        }
        return Static.manager
    }
    
    func showIndicator(withTitle title: String, and Description:String, vc:UIView) {
        let Indicator = MBProgressHUD.showAdded(to: vc, animated: true)
        Indicator.label.text = title
        Indicator.isUserInteractionEnabled = false
        Indicator.detailsLabel.text = Description
        Indicator.show(animated: true)
        UIApplication.shared.accessibilityRespondsToUserInteraction = false
    }
    func hideIndicator(vc:UIView) {
        MBProgressHUD.hide(for: vc, animated: true)
        UIApplication.shared.accessibilityRespondsToUserInteraction = true
    }
}
