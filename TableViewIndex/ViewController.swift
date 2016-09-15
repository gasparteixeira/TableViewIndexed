//
//  ViewController.swift
//  TableViewIndex
//
//  Created by Gaspar on 13/09/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var musicalGroups : NSDictionary = NSDictionary()
    var keysOfMusicalGroups : NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = Bundle.main
        let path = bundle.path(forResource: "bandas", ofType: "plist")
        musicalGroups = NSDictionary(contentsOfFile: path!)!
        keysOfMusicalGroups = NSMutableArray(array: musicalGroups.allKeys)
        keysOfMusicalGroups.sort(using: NSSelectorFromString("compare:"))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let myKey : String = keysOfMusicalGroups.object(at: section) as! String
        let sectionList : NSArray = musicalGroups.object(forKey: myKey) as! NSArray
        return sectionList.count
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let titulo : String = keysOfMusicalGroups.object(at: section) as! String
        return titulo
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return keysOfMusicalGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myId : String = "exemplo"
        var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: myId)
        
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: myId)
        }
        
        let section : Int = indexPath.section
        let row : Int = indexPath.row
        
        let key : String = keysOfMusicalGroups.object(at: section) as! String
        let group : NSArray = musicalGroups.object(forKey: key) as! NSArray
        let musicalGroup : String = group.object(at: row) as! String
        
        cell.textLabel?.text = musicalGroup
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

