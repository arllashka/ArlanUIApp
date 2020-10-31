//
//  CourseItem.swift
//  DesignCode
//
//  Created by Arlan on 10/14/20.
//

import SwiftUI

struct CourseItem: View {
    
    var course: Course = courses[0]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            HStack {
                Spacer()
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            Text(course.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                
            Text(course.subtitle)
                .font(.footnote)
                .foregroundColor(.white)
                
                
                
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .background(course.color)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color:course.color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem()
    }
}
