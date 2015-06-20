//
//  Comment.swift
//  SoundcloudSDK
//
//  Created by Kevin DELANNOY on 24/02/15.
//  Copyright (c) 2015 Kevin Delannoy. All rights reserved.
//

import UIKit

// MARK: - Comment definition
////////////////////////////////////////////////////////////////////////////

public struct Comment {
    ///User's identifier
    public let identifier: Int

    ///Creation date of the track
    public let createdAt: NSDate

    ///Track's identifier
    public let trackIdentifier: Int?

    ///User's identifier
    public let userIdentifier: Int?

    ///Comment's timestamp
    public let timestamp: NSTimeInterval?

    ///Body
    public let body: String

    ///User
    public let user: User?
}

////////////////////////////////////////////////////////////////////////////


// MARK: - Track Extensions
////////////////////////////////////////////////////////////////////////////

// MARK: Parsing
////////////////////////////////////////////////////////////////////////////

internal extension Comment {
    init?(JSON: JSONObject) {
        if let identifier = JSON["id"].intValue, body = JSON["body"].stringValue {
            self.identifier = identifier
            self.createdAt = JSON["created_at"].dateValue("yyyy/MM/dd HH:mm:ss VVVV") ?? NSDate()
            self.trackIdentifier = JSON["track_id"].intValue
            self.userIdentifier = JSON["user_id"].intValue
            self.timestamp = JSON["timestamp"].doubleValue
            self.body = body
            self.user = User(JSON: JSON["user"])
        }
        else {
            return nil
        }
    }
}

////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////