//
//  ProductionViewModel.swift
//  App373
//
//  Created by DJUROM on 8/03/2024.
//

import SwiftUI
import CoreData

final class ProductionViewModel: ObservableObject {
    
    @Published var planProducts: String = ""
    @Published var planQuantity: String = ""
    @Published var planBaker: String = ""
    @Published var planNumber: String = ""
    @Published var planDescription: String = ""

    @Published var isDetail: Bool = false
    @Published var isAdd: Bool = false
    @Published var isAddHavent: Bool = false
    @Published var isAddSpent: Bool = false

    @Published var plans: [PlanModel] = []
    @Published var selectedPlan: PlanModel?

    func addPlan() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PlanModel", into: context) as! PlanModel

        loan.planProducts = planProducts
        loan.planQuantity = planQuantity
        loan.planBaker = planBaker
        loan.planNumber = planNumber
        loan.planDescription = planDescription

        CoreDataStack.shared.saveContext()
    }
    
    func fetchPlans() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlanModel>(entityName: "PlanModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.plans = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.plans = []
        }
    }
}

