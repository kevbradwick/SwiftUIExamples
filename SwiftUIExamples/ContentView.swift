//
//  ContentView.swift
//  SwiftUIExamples
//
//  Created by Kevin Bradwick on 25/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Lists")) {
                    NavigationLink(destination: EditableListScreen()) {
                        Text("Editable list")
                    }
                }
            }.listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Examples"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
