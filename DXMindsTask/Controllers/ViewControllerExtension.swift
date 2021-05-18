//
//  ViewControllerExtension.swift
//  DXMindsTask
//
//  Created by apple on 19/05/21.
//

import UIKit

//MARK:- API Call
extension ViewController {
    
    func userList() {
        
        APICaller.getUser(url: APPURL.url, method: .get, parameters: nil, isLoaded: true, title: "", message: "Loading...", vc: view) { [weak self] response in
            
            guard let responseJson = try? JSONDecoder().decode(UserListModel.self, from: response) else {return}
            
            if responseJson.data.count > 0 {
                self?.userListModel = responseJson
                self?.saveToSingletone()
            }
            
        } failure: { error in
            showAlerts(title: "", message: error.localizedDescription)
        }
    }
}


extension ViewController: UserSettingsProtocol {
    func settingsTapped(_ value: String) {
        let vc = storyboard?.instantiateViewController(identifier: "popUpVC") as! popUpVC
        vc.userPic = value
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
}
