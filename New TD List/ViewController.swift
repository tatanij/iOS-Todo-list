//
//  ViewController.swift
//  New TD List
//
//  Created by Jasmeen Tatani on 20/07/2016.
//  Copyright © 2016 Aurous tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    var items: [String] = [] //Initialised with an empty array.

    @IBAction func addItem(sender: AnyObject) {
    //Used to add a new item to the todo list
        alert()
        
    }
    
    @IBOutlet var listTblView: UITableView! //The list of added items
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTblView.dataSource = self //Merges view with table view
    
    }
    
    //Following two functions required for DataSourse
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listItem") as! ItemTableViewCell
        cell.itemLabel.text = items[indexPath.row]//this will change the text to the current item in the table view in the array
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count //counts the number of items there are in the list
        
    }
    
    func alert(){
        let alert = UIAlertController(title: "", message: "", preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler{
            //This will allow for a text field to be present which you can use to add values in to the array and thus the todo list
            (textfield) in
            textfield.placeholder = "Task Description"
        }
        
        let add = UIAlertAction(title: "Add", style: .Default){
            (action) in
            let textfield = alert.textFields![0] as! UITextField
            self.items.append(textfield.text!) //adds value from the text field into the array "!" is there to unwrap the text
            self.listTblView.reloadData() //Should reload the table view once you have added a new item
           // print("hello") //testing for add button
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel){
            (alert) in
            
           // print ("hi")//testing to see if cancel button works
        }
        alert.addAction(add)
        alert.addAction(cancel)
        
        presentViewController(alert, animated: true, completion: nil) // allows for annimation of add and cancel button
    }
    
    //Delete function
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        items.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic) //deletes the row you are currently on 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

