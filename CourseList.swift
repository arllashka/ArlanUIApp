//
//  CourseList.swift
//  DesignCode
//
//  Created by Arlan on 10/14/20.
//

import SwiftUI

struct CourseList: View {
    var body: some View {
        List(0 ..< 20) { item in
            CourseRow()
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Courses")
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
