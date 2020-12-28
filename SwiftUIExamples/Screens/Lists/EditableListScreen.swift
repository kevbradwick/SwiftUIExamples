//
//  BasicListScreen.swift
//  SwiftUIExamples
//
//  Created by Kevin Bradwick on 27/12/2020.
//

import SwiftUI


// EditableListScreen demonstrates basic editing capabilities of editing a list
// including deleting, moving and adding new items.
//
// reference https://www.vadimbulavin.com/add-edit-move-and-drag-and-drop-in-swiftui-list/
struct EditableListScreen: View {
    
    // a struct to use within the list
    struct Item: Identifiable {
        let id = UUID()
        var name: String
    }
    
    // arbitrary data for the list. each will have an automatic uuid assigned to it
    @State private var data: [Item] = (0..<20).map { Item(name: "Item \($0)") }
    
    // track the edit mode of the list. this will be toggled with the edit button
    @State private var editMode = EditMode.inactive
    
    var body: some View {
        // data list must conform to the Identifiable protocol
        // the List struct takes care of scrolling through items
        List {
            // items need to be in a for loop rather than the List initialiser
            // so that we can add delete and move modiviers
            ForEach(data) { item in
                Text(item.name).padding()
            }
            .onDelete(perform: onDelete)
            .onMove(perform: onMove)
        }
        .navigationBarTitle(Text("Basic List"))
        .navigationBarItems(leading: EditButton(), trailing: addButton)
        .environment(\.editMode, $editMode)
    }
    
    // renders a '+' button or invisible depending on the edit mode
    private var addButton: some View {
        switch editMode {
        case .inactive:
            return AnyView(Button(action: onAdd) { Image(systemName: "plus") })
        default:
            return AnyView(EmptyView())
        }
    }
    
    func onMove(source: IndexSet, destination: Int) {
        data.move(fromOffsets: source, toOffset: destination)
    }
    
    func onDelete(offsets: IndexSet) {
        data.remove(atOffsets: offsets)
    }
    
    func onAdd() {
        let number = data.count
        data.append(Item(name: "Item \(number)"))
    }
}

struct BasicListScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditableListScreen()
    }
}
