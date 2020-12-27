//
//  BasicListScreen.swift
//  SwiftUIExamples
//
//  Created by Kevin Bradwick on 27/12/2020.
//

import SwiftUI

struct Animal: Identifiable {
    var id: Int
    var name: String
}

struct BasicListScreen: View {
    
    private var data: [Animal] = [
        Animal(id: 1, name: "Cat"),
        Animal(id: 2, name: "Dog"),
        Animal(id: 3, name: "Bat"),
        Animal(id: 5, name: "Horse"),
        Animal(id: 6, name: "Hare"),
        Animal(id: 7, name: "Rabbit"),
        Animal(id: 8, name: "Bird"),
        Animal(id: 9, name: "Monkey"),
        Animal(id: 10, name: "Lion"),
        Animal(id: 11, name: "Donkey"),
        Animal(id: 12, name: "Ant"),
        Animal(id: 13, name: "Spider"),
        Animal(id: 14, name: "Snake"),
        Animal(id: 15, name: "Pigeon"),
        Animal(id: 16, name: "Zebra"),
        Animal(id: 17, name: "Lizard"),
        Animal(id: 18, name: "Koala"),
        Animal(id: 19, name: "Ghecko"),
        Animal(id: 20, name: "Horse"),
        Animal(id: 21, name: "Horse"),
    ]
    
    var body: some View {
        // data list must conform to the Identifiable protocol
        // the List struct takes care of scrolling through items
        List(data) { item in
            Text(item.name).font(.title)
        }.navigationBarTitle(Text("Basic List"))
    }
}

struct BasicListScreen_Previews: PreviewProvider {
    static var previews: some View {
        BasicListScreen()
    }
}
