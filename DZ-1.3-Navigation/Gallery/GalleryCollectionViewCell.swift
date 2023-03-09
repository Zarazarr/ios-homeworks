//
//  GalleryCollectionViewCell.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 04.03.2023.
//

import UIKit

final class GalleryCollectionViewCell: UICollectionViewCell {
    
    let photo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DSC_0051")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCell() {
        contentView.addSubview(photo)
        backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
