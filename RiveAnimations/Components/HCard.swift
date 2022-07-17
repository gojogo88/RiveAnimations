//
//  HCard.swift
//  RiveAnimations
//
//  Created by Jonathan Go on 17.07.22.
//

import SwiftUI

struct HCard: View {
    var section: CourseSection
    
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Text(section.title)
                    .customFont(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(section.caption)
                    .customFont(.body)
            }
            Divider()
            section.image
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(section.color)
        .foregroundColor(.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct HCard_Previews: PreviewProvider {
    static var previews: some View {
        HCard(section: courseSections[0])
    }
}
