//
//  ViewController.swift
//  showImage
//
//  Created by Mohan K on 16/03/23.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var createImageView: UIImageView!
    @IBOutlet weak var userNmaeTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var viewBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraBtnPress))
    }
    
    @objc func cameraBtnPress() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else {return}
        createImageView.image = userPickedImage
        picker.dismiss(animated: true)
    }
    func coredataCreate() {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return        }
        let managedcontext = appdelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedcontext)!
        let user = NSManagedObject(entity: userEntity, insertInto: managedcontext)
        user.setValue(userNmaeTxtField, forKey: "username")
        user.setValue(emailTxtField, forKey: "email")
        user.setValue(passwordTxtField, forKey: "password")
        print(user)
        do {
            try managedcontext.save()
        }
        catch let error as NSError{
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func coredataretrive() {
        guard let appdelegate =  UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appdelegate.persistentContainer.viewContext
        let fetchResult = NSFetchRequest<NSFetchRequestResult>(entityName: "user")
        do {
            let result = try managedContext.fetch(fetchResult)
            for data in result as! [NSManagedObject] {
                
            }
        }
        catch {
            
        }
    }
    @IBAction func userNmaeTextField(_ sender: Any) {
    }
    
    @IBAction func emailIdTextField(_ sender: Any) {
    }
    
    @IBAction func passwordTextField(_ sender: Any) {
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        coredataCreate()
        if let imageData = createImageView.image?.pngData() {
            DataHelp .sharedInstance.example(data: imageData)
        }
    }
    
    @IBAction func viewButton(_ sender: Any) {
//        let arr = DataHelp.sharedInstance.fetchUser()
        
    }
}

