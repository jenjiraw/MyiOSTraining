//
//  ViewController.swift
//  BasicNavApp
//
//  Created by Jenjira on 4/25/2559 BE.
//  Copyright © 2559 Jenjira. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       let targetView = segue.destinationViewController
       let cellIndex = self.tableView.indexPathForSelectedRow
       
       let cell = self.tableView.cellForRowAtIndexPath(cellIndex!)
       
       targetView.title = cell?.textLabel?.text
        
       
    }

}

