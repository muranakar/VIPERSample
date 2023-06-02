//
//  ArticleEntity.swift
//  VIPERSample
//
//  Created by 村中令 on 2023/06/01.
//

import Foundation

struct ArticleEntity: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
