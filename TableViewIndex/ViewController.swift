//
//  ViewController.swift
//  TableViewIndex
//
//  Created by Gaspar on 13/09/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var musicalGroups : [[String]] = []
    var musicalTitles : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dict = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "bandas", ofType: "plist")!) as? [String:[String]] ?? [:]
        
        dict.keys.sorted().forEach{
            musicalTitles.append($0)
            musicalGroups.append(dict[$0]!.sorted())
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return musicalGroups[section].count
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return musicalTitles[section]

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return musicalTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "exemplo")
        cell.textLabel?.text = musicalGroups[indexPath.section][indexPath.row]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

