//
//  QRCodeList.swift
//  AstroQRCode
//
//  Created by Arvin Sanmuga Rajah on 08/11/2017.
//  Copyright © 2017 astro. All rights reserved.
//

import Foundation

//1 - Adopt the NSObject and NSCoding protocols
public class QRCode: NSObject, NSCoding {
    
    //5 - A safe way of naming my decoder key(s)
    struct Keys {
        static let id = "id"
        static let name = "name"
    }
    
    public var id: Int = 0
    public var name: String = ""
    
    override init() {}
    
    //4 - my own initializer
    public init(name: String) {
        self.name = name
    }
    
    //2 - this decodes our objects; this isn't called explicitly, it will be called with NSKeyedArchiver
    required public init(coder decoder: NSCoder) {
        //this retrieves our saved name object and casts it as a string
        if let id = decoder.decodeObject(forKey: Keys.id) as? String {
            self.id = Int(id)!
        }
        if let name = decoder.decodeObject(forKey: Keys.name) as? String {
            self.name = name
        }
    }
    
    //3 - this encodes our objects (saves them)
    public func encode(with coder: NSCoder) {
        //we are saving the name for the key "name"
        coder.encode("\(id)", forKey: Keys.id)
        coder.encode(name, forKey: Keys.name)
    }
}
