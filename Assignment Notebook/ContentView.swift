//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Ali on 27/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems = [
        AssignmentItem(course: "Math", description: "Unit 7 Test", dueDate: Date()),
        AssignmentItem(course: "Physics", description: "Unit 8 Test", dueDate: Date()),
        AssignmentItem(course: "English", description: "Unit 3 Test", dueDate: Date())
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                                .padding()
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove { indices, newOffset in
                    assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    assignmentItems.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("Assignment List")
            .navigationBarItems(leading: EditButton())

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
