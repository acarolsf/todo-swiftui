//
//  TodoRowView.swift
//  todo-app
//
//  Created by Ana Carolina on 04/02/21.
//

import SwiftUI

struct TODORowView: View {
    
    var todo: Todo
    
    var body: some View {
        HStack {
            Text(todo.todo)
            
            Spacer()
            
            if todo.isComplete == "true" {
                Image(systemName: "checkmark").imageScale(.medium)
            } else {
                Image(systemName: "xmark").imageScale(.medium)
            }
        }
    }
}
