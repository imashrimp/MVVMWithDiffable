//
//  PhotoModel.swift
//  MVVMWithDiffable
//
//  Created by 권현석 on 2023/09/19.
//

import Foundation

// MARK: - Welcome
struct RandomPhoto: Codable {
    let urls: Urls
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
