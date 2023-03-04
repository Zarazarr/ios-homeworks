//
//  ProfilePost.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 02.03.2023.
//
import UIKit

struct ProfilePost {
    var author: String
    var description: String
    var likes: Int
    var views: Int
    var image: UIImage
    
    static func makeMockModel() -> [ProfilePost] {
        return [
            ProfilePost(author: "LostFilm", description: "Вышел третий сезон Мандалорца. Новая серия! Мандалорец (The Mandalorian) 3 сезон 1 серия Глава 17: Ренегат (Chapter 17: The Apostate) Дата выхода Ru: 02 марта 2023 Далее на LostFilm.TV (www.lostfilm.tv/series/The_Mandalorian/season_3/episode_1/) | актуальном зеркале (https:www.lostfilm.today/series/The_Mandalorian/season_3/episode_1/)", likes: 1, views: 1, image: UIImage(named: "mandos2")!),
            ProfilePost(author: "Milwaukee", description: "Description 1", likes: 1, views: 1, image: UIImage(named: "3404")!),
            ProfilePost(author: "Доктор Дью", description: "250 полуляхов из 250", likes: 900, views: 2034, image: UIImage(named: "dr_diy")!),
            ProfilePost(author: "RC", description: "Description 3", likes: 3, views: 3, image: UIImage(named: "superhomen")!)
        ]
    }
}
