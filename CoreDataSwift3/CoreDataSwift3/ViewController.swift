//
//  ViewController.swift
//  CoreDataSwift3
//
//  Created by Ourangzaib khan on 10/24/16.
//  Copyright © 2016 Ourangzaib khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phonenumber: UITextField!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(_ sender: AnyObject) {
    savedata()
    }
    func savedata(){
        if((name.text?.characters.count)! > 0 ){
        let context = (UIApplication.shared.delegate as! AppDelegate).coreDataStack.persistentContainer.viewContext
        let person = Person(context: context)
            person.name = name.text;
            if let myNumber = NumberFormatter().number(from: phonenumber.text!) {
                person.phonenumber = Int(myNumber.intValue)
                // do what you need to do with myInt
            } else {
                person.phonenumber = 12323423
                // what ever error code you need to write
            }
        }
        
        
    }
}

