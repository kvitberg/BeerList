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
    var fetchedResultsController : NSFetchedResultsController<NSFetchRequestResult>!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //generateTestData()
        attemptFetch()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = fetchedResultsController.sections{
            return sections.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections{
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerCell
        configureCell(cell, indexPath: indexPath)
        return cell
    }
    func configureCell(_ cell: BeerCell, indexPath: IndexPath){
        if let beer =  fetchedResultsController.object(at: indexPath) as? Beer{
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
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Beer")
        
        let sortDescriptor = NSSortDescriptor(key: "brand", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        fetchedResultsController = controller
        
        
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type){
        case .insert:
            if let indexPath = newIndexPath{
                tableView.insertRows(at: [indexPath], with: .fade)
                
            }
            break
        case .delete:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
    
            }
            break
        case .update:
            if let indexPath = indexPath{
                let cell = tableView.cellForRow(at: indexPath) as! BeerCell
                //Update cell data
                configureCell(cell, indexPath: indexPath)
            }
        case .move:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let newIndexPath = newIndexPath{
                tableView.insertRows(at: [newIndexPath], with: .fade)
                
            }
            break
        }
    }
    func generateTestData(){
        let beer =  NSEntityDescription.insertNewObject(forEntityName: "Beer", into: appDelegate.managedObjectContext) as! Beer
        beer.name = "Pilsner"
        beer.brand = "Bintang"
        beer.country = "Indonesia"
        
        let beer2 =  NSEntityDescription.insertNewObject(forEntityName: "Beer", into: appDelegate.managedObjectContext) as! Beer
        beer2.name = "Pilsner"
        beer2.brand = "Ringnes"
        beer2.country = "Norway"
        
        let beer3 =  NSEntityDescription.insertNewObject(forEntityName: "Beer", into: appDelegate.managedObjectContext) as! Beer
        beer3.name = "Pilsner"
        beer3.brand = "Kirin"
        beer3.country = "Japan"
        
        let beer4 =  NSEntityDescription.insertNewObject(forEntityName: "Beer", into: appDelegate.managedObjectContext) as! Beer
        beer4.name = "Pilsner"
        beer4.brand = "Tuborg"
        beer4.country = "Denmark"
        
        //appDelegate.saveContext()
    }

}

