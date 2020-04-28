//
//  IncomingMessage.swift
//  WhatsAppClone
//
//  Created by nghiadang1205 on 4/28/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import Foundation
import JSQMessagesViewController

class IncomingMessage {
    
    var collectionView: JSQMessagesViewController
    
    init(collectionView_: JSQMessagesViewController) {
        collectionView = collectionView_
    }
    
    // MARK: Create Message
    
    func createMessage(messageDictionary: NSDictionary, chatRoomId: String) -> JSQMessage? {
        
        var message: JSQMessage?
        
        let type = messageDictionary[kTYPE] as! String
        
        switch type {
        case kTEXT:
            message = createTextMessage(messageDictionary: messageDictionary, chatRoomId: chatRoomId)
        case kPICTURE:
            print("create picture message")
        case kVIDEO:
            print("create video message")
        case kAUDIO:
            print("create audio message")
        case kLOCATION:
            print("create location message")
        default:
            print("Unknown: type incoming message")
        }
        
        if message != nil {
            return message
        }
        
        return nil
        
    }
    
    // MARK: Create message types
    
    func createTextMessage(messageDictionary: NSDictionary, chatRoomId: String) -> JSQMessage {
        
        let name = messageDictionary[kSENDERNAME] as? String
        let userId = messageDictionary[kUSERID] as? String
        
        var date: Date!
        
        if let created = messageDictionary[kCREATEAT] {
            if (created as! String).count != 14 {
                date = Date()
            } else {
                date = dateFormatter().date(from: created as! String)
            }
        } else {
            date = Date()
        }
        
        let text = messageDictionary[kMESSAGE] as! String
        
        return JSQMessage(senderId: userId, senderDisplayName: name, date: date, text: text)
        
    }
    
}
