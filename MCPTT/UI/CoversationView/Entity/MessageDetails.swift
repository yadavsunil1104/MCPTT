//
//  MessageDetails.swift
//  mcpttapp
//
//  Created by Hemanth Kumar H N on 03/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation

enum MessageKind {
    case text(String)
    case video(Data)
}

protocol MessageType {
    var sender: Sender { get }
    var messageId: String { get }
    var sentDate: Date { get }
    var kind: MessageKind { get }
}

struct Sender {
    public let id: String
    public let displayName: String
    public init(id: String, displayName: String) {
        self.id = id
        self.displayName = displayName
    }
}

struct MesssageDetails: MessageType {
    var messageId: String
    var sender: Sender
    var sentDate: Date
    var kind: MessageKind
    
    private init(kind: MessageKind, sender: Sender, messageId: String, date: Date) {
        self.kind = kind
        self.sender = sender
        self.messageId = messageId
        self.sentDate = date
    }
    init(text: String, sender: Sender, messageId: String, date: Date) {
        self.init(kind: .text(text), sender: sender, messageId: messageId, date: date)
    }
    
    //todo
//    init(audioUrl: Data, sender: Sender, messageId: String, date: Date) {
//       // let mediaItem = MockMediaItem(image: thumbnail)
//        self.init(kind: .audio(Data), sender: sender, messageId: messageId, date: date)
//    }
}
