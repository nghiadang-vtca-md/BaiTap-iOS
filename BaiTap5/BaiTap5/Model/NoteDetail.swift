//
//  NoteDetail.swift
//  BaiTap5
//
//  Created by user159518 on 1/13/20.
//  Copyright © 2020 iMac_VTCA. All rights reserved.
//

import Foundation


struct Note: Codable {
    let id: String
    var title: String
    var description: String
    var latitude: Float
    var longitude: Float
    var dateCreated: String
}
