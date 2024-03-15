//
//  StaffViewModel.swift
//  App373
//
//  Created by DJUROM on 7/03/2024.
//

import SwiftUI
import CoreData

final class StaffViewModel: ObservableObject {
    
    @Published var staffName: String = ""
    @Published var staffSalary: String = ""
    @Published var staffPost: String = ""
    @Published var staffStars: Int = 0

    @Published var isDetail: Bool = false
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false

    @Published var staffs: [StaffModel] = []
    @Published var selectedStaff: StaffModel?

    func addStaff() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "StaffModel", into: context) as! StaffModel

        loan.staffName = staffName
        loan.staffSalary = staffSalary
        loan.staffPost = staffPost
        loan.staffStars = Int16(staffStars)

        CoreDataStack.shared.saveContext()
    }
    
    func fetchStaffs() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<StaffModel>(entityName: "StaffModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.staffs = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.staffs = []
        }
    }
}

