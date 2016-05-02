//
//  ViewController.swift
//  BeerList
//
//  Created by Scott  on 14/04/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate  {

    @IBOutlet weak var  tableView: UITableView!
    var fetchedResultsController : NSFetchedResultsController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        generateTestData()
        attemptFetch()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = fetchedResultsController.sections{
            return sections.count
        }
        return 0
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections{
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier("BeerCell", forIndexPath: indexPath) as! BeerCell
        configureCell(cell, indexPath: indexPath)
        return cell
    }
    func configureCell(cell: BeerCell, indexPath: NSIndexPath){
        if let beer =  fetchedResultsController.objectAtIndexPath(indexPath) as? Beer{
            //Update Data
            cell.configuereCell(beer)
            
        }
    }
    
    func attemptFetch(){
        setFetchedResults()
        do{
            try self.fetchedResultsController.performFetch()
        } catch {
            let error = error as NSError
            print("\(error), \(error.userInfo)")
        }
    }
    func setFetchedResults(){
        let fetchRequest = NSFetchRequest(entityName: "Beer")
        
        let sortDescriptor = NSSortDescriptor(key: "brand", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        fetchedResultsController = controller
        
        
    }
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        
        switch(type){
        case .Insert:
            if let indexPath = newIndexPath{
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
            }
            break
        case .Delete:
            if let indexPath = indexPath{
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    
            }
            break
        case .Update:
            if let indexPath = indexPath{
                let cell = tableView.cellForRowAtIndexPath(indexPath) as! BeerCell
                //Update cell data
                configureCell(cell, indexPath: indexPath)
            }
        case .Move:
            if let indexPath = indexPath{
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
            if let newIndexPath = newIndexPath{
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
                
            }
            break
        }
    }
    func generateTestData(){
        let beer =  NSEntityDescription.insertNewObjectForEntityForName("Beer", inManagedObjectContext: appDelegate.managedObjectContext) as! Beer
        beer.name = "Pilsner"
        beer.brand = "Bintang"
        beer.country = "Indonesia"
        
        let beer2 =  NSEntityDescription.insertNewObjectForEntityForName("Beer", inManagedObjectContext: appDelegate.managedObjectContext) as! Beer
        beer2.name = "Pilsner"
        beer2.brand = "Ringnes"
        beer2.country = "Norway"
        
        let beer3 =  NSEntityDescription.insertNewObjectForEntityForName("Beer", inManagedObjectContext: appDelegate.managedObjectContext) as! Beer
        beer3.name = "Pilsner"
        beer3.brand = "Kirin"
        beer3.country = "Japan"
        
        let beer4 =  NSEntityDescription.insertNewObjectForEntityForName("Beer", inManagedObjectContext: appDelegate.managedObjectContext) as! Beer
        beer4.name = "Pilsner"
        beer4.brand = "Tuborg"
        beer4.country = "Denmark"
        
        //appDelegate.saveContext()
    }

}

