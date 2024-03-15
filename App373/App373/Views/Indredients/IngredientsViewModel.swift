//
//  IngredientsViewModel.swift
//  App373
//
//  Created by DJUROM on 10/03/2024.
//

import SwiftUI
import CoreData

final class IngredientsViewModel: ObservableObject {

    @Published var iName: String = ""
    @Published var iQuantity: String = ""
    @Published var iCost: String = ""

    @Published var isDetail: Bool = false
    @Published var isAddIng: Bool = false
    @Published var isAddHavent: Bool = false
    @Published var isAddSpent: Bool = false
    @Published var isDelete: Bool = false

    @AppStorage("haveIng") var haveIng = "0"
    @AppStorage("needIng") var needIng = "0"
    @Published var haveIng1 = ""
    @Published var needIng1 = ""
    
    @AppStorage("spent") var spent = ""
    @Published var spent1 = ""

    @Published var ingredients: [IngredientsModel] = []
    @Published var selectedIngredient: IngredientsModel?

    func addIng() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "IngredientsModel", into: context) as! IngredientsModel

        loan.iName = iName
        loan.iQuantity = iQuantity
        loan.iCost = iCost

        CoreDataStack.shared.saveContext()
    }
    
    func fetchIng() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<IngredientsModel>(entityName: "IngredientsModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.ingredients = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.ingredients = []
        }
    }
}
