//
//  MovieViewController.swift
//  MovieTime
//
//  Created by Cambrian on 2022-07-27.
//

import UIKit
import CoreData

class MovieViewController: UIViewController {

    @IBOutlet weak var movieNameTextField: UITextField!
    
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //if text field is not empy and character count is not 0
        if let name = movieNameTextField.text, name.count != 0
        {
            save(name: name)
        }
    }
    
    //method parameter: name (String)
    //Description: Save new movie in core data
    func save(name: String) {
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            
                return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)!
            
            let movie = Movie(entity: entity, insertInto: managedContext)
        
            movie.user = user
            movie.name = name
           
            do {
                try managedContext.save() //saving movie to particular user in core data
               
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    
    

}
