//
//  FUser.swift
//  WhatsAppClone
//
//  Created by nghiadang1205 on 4/23/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import Foundation

class FUser {
    
    let objectId: String
    var pushId: String?
    
    let createAt: Date
    var updatedAt: Date
    
    var email: String
    var firstname: String
    var lastname: String
    var fullname: String
    var avatar: String
    var isOnline: Bool
    var phoneNumber: String
    var countryCode: String
    var country: String
    var city: String
    
    var contacts: [String]
    var blockedUsers: [String]
    let loginMethod: String
    
    // MARK: Initializers
    
    init(_objectId: String, _pushId: String?, _createAt: Date, _updatedAt: Date, _email: String, _firstname: String, _lastname: String, _avatar: String = "", _loginMethod: String, _phoneNumber: String, _city: String, _country: String) {
        
        objectId = _objectId
        pushId = _pushId
        
        createAt = _createAt
        updatedAt = _updatedAt
        
        email = _email
        firstname = _firstname
        lastname = _lastname
        fullname = _firstname + " " + _lastname
        avatar = _avatar
        isOnline = true
        
        city = _city
        country = _country
        
        loginMethod = _loginMethod
        phoneNumber = _phoneNumber
        countryCode = ""
        blockedUsers = []
        contacts = []
    }
    
//    init(_dictionary: NSDictionary) {
////        objectId = _dictionary
//    }
}
