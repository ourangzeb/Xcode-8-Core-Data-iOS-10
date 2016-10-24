//
//  DisplayViewController.swift
//  CoreDataSwift3
//
//  Created by Ourangzaib khan on 10/24/16.
//  Copyright © 2016 Ourangzaib khan. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var dataTableView: UITableView!
    var person : [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).coreDataStack.persistentContainer.viewContext//corepersistentContainer.viewContext
        
        do{
            person = try context.fetch(Person.fetchRequest())
            print(person)
            dataTableView.reloadData();
        }catch{
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCellTableViewCell
        
        cell.name.text = person[indexPath.row].name
        cell.phonenumber.text = String(person[indexPath.row].phonenumber)
        
        return cell;
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
