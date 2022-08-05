//
//  UserViewController.swift
//  MovieTime
//
//  Created by Cambrian on 2022-07-27.
//

import UIKit
import CoreData

class UserViewController: UIViewController {

    var users: [User] = []
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let name = userNameTextField.text //if text field is not null
        {
            save(name: name) //name will be set
        }
    }
    
    //method parameter: name (String)
    //Description: Save new user in core data
    func save(name: String) {
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            
                return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
            
            let user = User(entity: entity, insertInto: managedContext)
            
            user.name = name
            
            do {
                try managedContext.save()//saving text field's data to core data
                users.append(user)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    
    

}
