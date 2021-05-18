//
//  DataStorage.swift
//  DXMindsTask
//
//  Created by apple on 18/05/21.
//

import Foundation

class DataStorage {
    
    private init() {}
    static let shared = DataStorage()
    
    var id: [Int]?
    var emailID: [String]?
    var firstName: [String]?
    var lastName: [String]?
    var userImage: [String]?
    
}
