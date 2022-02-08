//
//  KeyManager.swift
//  Runner
//
//  Created by Milad Zolfaghari on 2/7/22.
//

import Foundation

struct KeyManager {
   private let keyFilePath = Bundle.main.path(forResource: "APIKey",      ofType: "plist")
   func getKeys() -> NSDictionary? {
     guard let keyFilePath = keyFilePath else {
       return nil
     }
     return NSDictionary(contentsOfFile: keyFilePath)
   }
   
   func getValue(key: String) -> AnyObject? {
       guard let keys = getKeys() else {
         return nil
       }
     return keys[key]! as AnyObject
   }
}
