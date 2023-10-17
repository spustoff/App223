//
//  MainViewModel.swift
//  App223
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI
import CoreData

final class MainViewModel: ObservableObject {
    
    @AppStorage("profile_name") var profile_name: String = ""
    
    @Published var properties: [MainModel] = []
    
    @Published var selectedProperty: MainModel?
    @Published var isDetail: Bool = false
    
    @Published var name: String = ""
    @Published var price: String = ""
    @Published var text: String = ""
    
    func addProperty(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "MainModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "MainModel", into: context) as! MainModel
        
        trans.name = name
        trans.price = Int16(price) ?? 0
        trans.text = text
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchProperties() {
        
        CoreDataStack.shared.modelName = "MainModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MainModel>(entityName: "MainModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.properties = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.properties = []
        }
    }
}
