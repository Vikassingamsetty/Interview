//
//  ApiCaller.swift
//  DXMindsTask
//
//  Created by apple on 18/05/21.
//

import Foundation
import Alamofire

class APICaller {
    
    public static func getUser(url: String, method: HTTPMethod, parameters: Parameters?,isLoaded:Bool, title:String, message:String, vc:UIView, success: @escaping(Data)->Void, failure: @escaping(Error)->Void) {
        
        if Reachability.isConnectedToNetwork() {
            Indicator.shared().showIndicator(withTitle: title, and: message, vc: vc)
            AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (responseData) in
                Indicator.shared().hideIndicator(vc: vc)
                let serverData = responseData.result
                
                switch serverData{
                case .success(_):
                    success(responseData.data!)
                case .failure(let error):
                    failure(error)
                }
            }
        }else{
            showAlerts(title: Network.title, message: Network.message)
        }
        
    }
    
}
