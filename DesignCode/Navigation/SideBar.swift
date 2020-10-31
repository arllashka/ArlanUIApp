//
//  SideBar.swift
//  DesignCode
//
//  Created by Arlan on 10/14/20.
//

import SwiftUI

struct SideBar: View {
    var body: some View {
        NavigationView {
            content
            
            CoursesView()
        }
    }
    var content: some View{
        List {
            NavigationLink(destination: CoursesView()) {
                Label("Courses", systemImage: "book.closed")
            }
            Label("Tutorial", systemImage: "list.bullet.rectangle")
            Label("Livestreams", systemImage: "tv")
            Label("Certificates", systemImage: "mail.stack")
            Label("Search", systemImage: "magnifyingglass")
            
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Learn")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {}) {
                    Image(systemName: "person.crop.circle")
                }
            }
        }
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
