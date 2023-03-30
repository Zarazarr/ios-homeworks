//
//  GalleryCollectionViewCell.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 04.03.2023.
//

import UIKit

protocol CustomCollectionViewCellDelegate: AnyObject {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

final class GalleryCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CustomCollectionViewCellDelegate?
    
    private var indexPathCell = IndexPath()
    
    lazy var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DSC_0051")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    @objc private func tapAction() {
        delegate?.didTapImageInCell(photo.image, frameImage: photo.frame, indexPath: indexPathCell)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
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
