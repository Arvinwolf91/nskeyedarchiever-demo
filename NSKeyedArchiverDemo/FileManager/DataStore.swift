//
//  DataStore.swift
//  AstroQRCode
//
//  Created by Arvin Sanmuga Rajah on 13/11/2017.
//  Copyright © 2017 astro. All rights reserved.
//

import UIKit

class DataStore: NSObject, NSCoding {
    
    struct Keys {
        static let qrcodes = "qrcodes"
    }
    
    private override init() {}
    private var qrcodes: [QRCode] = []
    
    required init(coder decoder: NSCoder) {
        qrcodes = decoder.decodeObject(forKey: Keys.qrcodes) as! [QRCode]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(qrcodes, forKey: Keys.qrcodes)
    }
    
    func addQRCode(item: QRCode) {
        item.id = (self.qrcodes.last != nil) ? self.qrcodes.last!.id + 1 : 1
        self.qrcodes.append(item)
    }
    
    func deleteQRCode(qrId: Int) {
        self.qrcodes = self.qrcodes.filter {
            return $0.id != qrId
        }
    }
    
    func deleteAllQRCodes() {
        self.qrcodes = []
    }
    
    func allQRCodes() -> [QRCode] {
        return self.qrcodes
    }
    
    func saveDataToFile(_ filePath: String) {
        NSKeyedArchiver.archiveRootObject(self, toFile: filePath)
    }
    
    class func loadDataFromFile(_ filePath: String) -> DataStore {
        if let dataStore = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? DataStore {
            return dataStore
        }
        else {
            return DataStore()
        }
    }
}
