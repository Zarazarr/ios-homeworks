//
//  PostTableViewCell.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 03.03.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let contentWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let authorText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBackground
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()

    private let likesText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let viewsText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeCell()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorText.text = ""
        postImageView.image = nil
        descriptionText.text = ""
        likesText.text = ""
        viewsText.text = ""
    }
    
    func setupCell(model: ProfilePost) {
        authorText.text = model.author
        postImageView.image = model.image
        descriptionText.text = model.description
        likesText.text = "Likes: \(model.likes)"
        viewsText.text = "Views: \(model.views)"
    }
    
    private func customizeCell() {
//        contentView.backgroundColor = .white
    }
    
    private func layout() {
        contentView.addSubview(authorText)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionText)
        contentView.addSubview(likesText)
        contentView.addSubview(viewsText)
        
        NSLayoutConstraint.activate([
        
            authorText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      
            postImageView.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: 16),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            descriptionText.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesText.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 10),
            likesText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            viewsText.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 10),
            viewsText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}
