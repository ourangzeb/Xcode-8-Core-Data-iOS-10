# Xcode-8-Core-Data-iOS-10 
===================


Very basic tutorial i have created the Sample page using Swift 3 and Xcode 8 for so that people can understand how Core Data works. In this way you can easily get the sample run it on your device and see how new core data works.

----------


Starting
-------------

First make a sample Project with any name like in image and select the CoreData Option.
![enter image description here](https://dl.dropboxusercontent.com/s/yt5gsyllzgcjbqe/Screen%20Shot%202016-10-24%20at%205.29.11%20PM.png?dl=0)

in AppDelegate. swift create object like below code. and replace the applicationWillTerminate function by below code.
```
lazy var coreDataStack = PersistantData()


  func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        coreDataStack.saveContext()
    }

```
Make a new class name "PersistantData.swift".
you will see the code below into the Appdelegate.
Copy and paste this code into the PersistantData.swift File

```
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CoreDataSwift3")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
```
You can create entry like this.

![enter image description here](https://dl.dropbox.com/s/9z4l3ove96q1lo9/Screen%20Shot%202016-10-24%20at%205.47.37%20PM.png?dl=0)

For Creating the subclasses of entries you can see Image Below.  This will create two files like in this case **"Person+CoreDataClass.swift"** and **"Person+CoreDataProperties.swift"**

**(Note)** if you changed the properties of entry you may need to update regenerate the files.


![enter image description here](https://dl.dropbox.com/s/woq06mx3dnt8brf/Screen%20Shot%202016-10-24%20at%205.55.38%20PM.png?dl=0)

For Storing Data into the Core Data use the code below.

```
let context = (UIApplication.shared.delegate as! AppDelegate).coreDataStack.persistentContainer.viewContext
        let person = Person(context: context)
            person.name = name.text	
            if let myNumber = NumberFormatter().number(from: phonenumber.text!) {
	  person.phonenumber = Int(myNumber.intValue)
	  context.save()
                // do what you need to do with myInt
            } else {
                person.phonenumber = 12323423
                // what ever error code you need to write
            }

```
You can 


Fore Retrieving Data we are using. in **"DisplayViewController.swift"**
```
 let context = (UIApplication.shared.delegate as! AppDelegate).coreDataStack.persistentContainer.viewContext//corepersistentContainer.viewContext
        var person : [Person] = []
    
     do{
     person = try context.fetch(Person.fetchRequest())
            dataTableView.reloadData();
        }catch{
            
        }
```
**The final out put will be this.**

![enter image description here](https://dl.dropboxusercontent.com/s/i6p5ojnwr33fqz6/Simulator%20Screen%20Shot%20Oct%2024,%202016,%204.41.57%20PM.png?dl=0)

and 

![enter image description here](https://dl.dropbox.com/s/f37zajmkchmkrec/Simulator%20Screen%20Shot%20Oct%2024,%202016,%204.42.26%20PM.png?dl=0)

