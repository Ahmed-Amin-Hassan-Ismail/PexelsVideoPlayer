//
//  QueryTagView.swift
//  PexelsVideoPlayer
//
//  Created by Ahmed Amin on 21/11/2022.
//

import SwiftUI

struct QueryTagView: View {
    var query: Query
    var isSelected: Bool
    
    var body: some View {
        Text(query.rawValue)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(isSelected ? .primary : .gray)
            .padding(10)
            .background(.thinMaterial)
            .cornerRadius(10)
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTagView(query: Query.food, isSelected: true)
    }
}
