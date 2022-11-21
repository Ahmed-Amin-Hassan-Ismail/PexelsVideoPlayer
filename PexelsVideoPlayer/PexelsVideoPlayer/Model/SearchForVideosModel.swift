//
//  SearchForVideosModel.swift
//  PexelsVideoPlayer
//
//  Created by Ahmed Amin on 21/11/2022.
//

import Foundation


struct SearchForVideosModel: Codable {
    var page: Int?
    var perPage: Int?
    var totalResults: Int?
    var url: String?
    var videos: [Video]?
}


struct Video: Identifiable, Codable {
    var id: Int?
    var image: String?
    var duration: Int?
    var user: User?
    var videoFiles: [VideoFiles]?
}

struct User: Identifiable, Codable {
    var id: Int?
    var name: String?
    var url: String?
    
}

struct VideoFiles: Identifiable, Codable {
    var id: Int?
    var quality: String?
    var fileType: String?
    var link: String?
}
