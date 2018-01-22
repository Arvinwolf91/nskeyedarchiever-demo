//
//  TableViewController.swift
//  NSKeyedArchiverDemo
//
//  Created by Arvin Sanmuga Rajah on 22/01/2018.
//  Copyright © 2018 Arvin Sanmuga Rajah. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var list:[QRCode] {
        get {
            return FileStorage.loadQRCodes()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addCode(_ sender: Any) {
        FileStorage.saveQRCode(item: QRCode(name:"#900"))
        tableView.reloadData()
    }
    
    @IBAction func clearList(_ sender: Any) {
        FileStorage.deleteAllQRCodes()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let alertcontroller = UIAlertController(title: "Confirm Delete?", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            FileStorage.deleteQRCode(qrId: self.list[indexPath.row].id)
            tableView.reloadData()
        }
        
        alertcontroller.addAction(cancelAction)
        alertcontroller.addAction(okAction)
        self.present(alertcontroller, animated: true, completion: nil)
    }
}


