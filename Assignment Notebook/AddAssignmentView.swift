//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Ali on 27/07/2022.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var showingAddItemView = false
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["Physics", "Arabic", "Math", "Chemistry", "English", "Biology"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Courses 📚", selection: $course) {
                    ForEach(AddAssignmentView.courses, id: \.self) { priorities in
                        Text(priorities)
                    }
                }
                TextField("Desription..", text: $description)
                DatePicker("Due Date  🗓", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add Assignments👇")
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0 && description.count > 0 {
                    let item = AssignmentItem(id: UUID(), course: course, description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
            
        }
    }
    
    struct AddAssignmentView_Previews: PreviewProvider {
        static var previews: some View {
            AddAssignmentView(assignmentList: AssignmentList())
        }
    }
}
