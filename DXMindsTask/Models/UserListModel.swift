//
//  UserListModel.swift
//  DXMindsTask
//
//  Created by apple on 18/05/21.
//

import Foundation

struct UserListModel: Codable {
    let data: [DataList]
}

struct DataList: Codable {
    let id: Int?
    let email, firstName, lastName: String?
    let avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case id, email, avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
}
