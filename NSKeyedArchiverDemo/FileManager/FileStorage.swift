//
//  RealmWrapper.swift
//  AstroQRCode
//
//  Created by Arvin Sanmuga Rajah on 08/11/2017.
//  Copyright © 2017 astro. All rights reserved.
//

import UIKit

class FileStorage {
    
    private class func filePath() -> String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return (url!.appendingPathComponent("Data").path)
    }
    
    class func saveQRCode(item: QRCode) {
        let filePath = self.filePath()
        let dataStore = DataStore.loadDataFromFile(filePath)
        dataStore.addQRCode(item: item)
        dataStore.saveDataToFile(filePath)
    }
    
    class func deleteQRCode(qrId: Int) {
        let filePath = self.filePath()
        let dataStore = DataStore.loadDataFromFile(filePath)
        dataStore.deleteQRCode(qrId: qrId)
        dataStore.saveDataToFile(filePath)
    }
    
    class func deleteAllQRCodes() {
        let filePath = self.filePath()
        let dataStore = DataStore.loadDataFromFile(filePath)
        dataStore.deleteAllQRCodes()
        dataStore.saveDataToFile(filePath)
    }
    
    class func loadQRCodes() -> [QRCode] {
        let filePath = self.filePath()
        let dataStore = DataStore.loadDataFromFile(filePath)
        return dataStore.allQRCodes()
    }
}

