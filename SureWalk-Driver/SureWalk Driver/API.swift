//
//  API.swift
//  SureWalk Driver
//
//  Created by Benny Singer on 4/3/17.
//  Copyright © 2017 Rohan Trivedi. All rights reserved.
//

import UIKit
import Parse

class API: NSObject {
    
    class func loadData(items: Int, success: @escaping ([PFObject]) -> (), failure: @escaping (Error) -> ()) {
        // construct PFQuery
        let query = PFQuery(className: "Request")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = items
        
        // fetch data asynchronously
        query.findObjectsInBackground { (requests: [PFObject]?, error: Error?) in
            if let requests = requests {
                // do something with the data fetched
                success(requests)
            } else {
                // handle error
                failure(error!)
            }
        }
    }
    
    class func acceptRequest(request: PFObject, success: @escaping () -> (), failure: @escaping () -> ()) {
        let query = PFQuery(className: "Request")
        query.getObjectInBackground(withId: request["_id"] as! String) {
            (object, error) -> Void in
            if error != nil {
                failure()
            } else {
                if let object = object {
                    if object["driver1"] != nil {
                        if object["driver2"] != nil {
                            failure()
                            return
                        } else {
                            object["driver2"] = PFUser.current()
                        }
                    }
                    else {
                        object["driver1"] = PFUser.current()
                    }
                }
                object!.saveInBackground()
                success()
            }
        }
    }
}
