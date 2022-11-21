//
//  VideoCard.swift
//  PexelsVideoPlayer
//
//  Created by Ahmed Amin on 21/11/2022.
//

import SwiftUI

struct VideoCard: View {
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160, height: 250)
                        .cornerRadius(30)
                    
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(width: 160, height: 250)
                        .cornerRadius(30)
                    
                }
                
                
                VStack(alignment: .leading) {
                    Text("30 Sec")
                        
                    
                    Text("By XYZ")
                        .multilineTextAlignment(.leading)
                    
                }
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .shadow(radius: 20)
                .padding()
            }
            
            Image(systemName: "play.fill")
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(30)
        }
    }
}

struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        VideoCard()
    }
}
