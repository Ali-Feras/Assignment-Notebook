//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Ali on 27/07/2022.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items = [
        AssignmentItem(course: "Math", description: "Unit 7 Test", dueDate: Date()),
        AssignmentItem(course: "Physics", description: "Unit 8 Test", dueDate: Date()),
        AssignmentItem(course: "English", description: "Unit 3 Test", dueDate: Date())
    ]
}
