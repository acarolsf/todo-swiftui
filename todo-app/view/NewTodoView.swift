//
//  NewTodoView.swift
//  todo-app
//
//  Created by Ana Carolina on 04/02/21.
//

import SwiftUI

struct NewTODOView: View {
    
    @State private var newTODO = ""
    @ObservedObject var session = FirebaseSession()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("TODO: ")
                    TextField("Enter TODO", text: $newTODO)
                        .padding()
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                    Text("Add")
                }
            }
        }
        .padding()
    }
    
    func addTodo() {
        if (!newTODO.isEmpty) {
            session.uploadTODO(todo: newTODO)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewTODOView_Previews: PreviewProvider {
    static var previews: some View {
        NewTODOView()
    }
}
