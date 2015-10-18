//
//  ClassTableViewController.swift
//  dots
//
//  Created by CY on 10/18/15.
//  Copyright © 2015 CY. All rights reserved.
//

import UIKit

class ClassTableViewController: UITableViewController {
    
    var data : NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()

        let dataPath = NSBundle.mainBundle().pathForResource("Challenge", ofType: "plist")
        data = NSArray(contentsOfFile: dataPath!)
        title = "IQ Challenge"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseidentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        let item : Dictionary = data!.objectAtIndex(indexPath.row) as! Dictionary<String, String>
        var question = item["question"]
        cell.textLabel!.text = question
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segue"{
            let destination = segue.destinationViewController as? ClassViewController
            let row = tableView.indexPathForSelectedRow?.row
            let item : Dictionary = data!.objectAtIndex(row!) as! Dictionary<String, String>
            var question = item["question"]
            destination!.question = question!
            destination!.answer = item["answer"]!
            destination!.id = item["id"]!
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
