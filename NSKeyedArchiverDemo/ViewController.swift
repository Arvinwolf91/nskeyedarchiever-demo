//
//  ViewController.swift
//  NSKeyedArchiverDemo
//
//  Created by Arvin Sanmuga Rajah on 22/01/2018.
//  Copyright © 2018 Arvin Sanmuga Rajah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func readQRCodeList() -> [QRCode] {
        return FileStorage.loadQRCodes()
    }
    
    func addNewQRCode(code: String) {
        FileStorage.saveQRCode(item: QRCode(name:code))
    }
    
    func deleteQRCode(qrId: Int) {
        FileStorage.deleteQRCode(qrId: qrId)
    }
    
    func deleteAllQRCodes() {
        FileStorage.deleteAllQRCodes()
    }
}

