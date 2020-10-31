//
//  CoursesView.swift
//  DesignCode
//
//  Created by Arlan on 10/13/20.
//

import SwiftUI

struct CoursesView: View {
    
    @State var show = false
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    @Namespace var namespace
    @Namespace var namespace2
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            if horizontalSizeClass == .compact{
                tabBar
            }else{
                sideBar
            }
            fullContent
                .background(VisualEffectBlur(blurStyle: .systemMaterial).edgesIgnoringSafeArea(.all))
        }.navigationTitle("Courses")
    }
    var content: some View{
        ScrollView {
            
            VStack(spacing: 0) {
                LazyVGrid (
                    columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], spacing: 16) {
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                .frame(height: 200)
                                .onTapGesture{
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)){
                                        show.toggle()
                                        selectedItem = item
                                        isDisabled = true
                                    }
                                }.disabled(isDisabled)
                        }.matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                    }
                    
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                
                Text("Latest Sections")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 240))]) {
                    ForEach(courseSections) { item in
                        NavigationLink(destination: CourseDetail(namespace: namespace2)) {
                            CourseRow(item: item)
                        }
                    }
                }.padding()
            }
            
            
        }
        .zIndex(1)
        .navigationTitle("Courses")
    }
    @ViewBuilder
    var fullContent: some View{
        if selectedItem != nil {
            ZStack(alignment: .topLeading) {
                CourseDetail(course: selectedItem!, namespace: namespace)
                
                CloseButton()
                    .padding(.leading, 16)
                    .onTapGesture{
                        withAnimation(.spring()){
                            show.toggle()
                            selectedItem = nil
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                                isDisabled = false
                            }
                            
                        }
                    }
            }.zIndex(2)
            .frame(maxWidth: 712)
            .frame(maxWidth: .infinity)
            
        }
    }
    var tabBar : some View {
        TabView {
            NavigationView {
                content
            }
            .tabItem {
                Image(systemName: "book.closed")
                Text("Courses")
            }
            
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Tutorials")
            }
            
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "tv")
                Text("Livestreams")
            }
            
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "mail.stack")
                Text("Certificates")
            }
            
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }
    }
    
    var sideBar : some View {
        NavigationView {
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
            
            
            content
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
