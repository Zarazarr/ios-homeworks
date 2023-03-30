//
//  PostTableViewCell.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 03.03.2023.
//

import UIKit

protocol PostTableViewCellDelegate: AnyObject {
    func didTapImage(indexPath: IndexPath)
}

class PostTableViewCell: UITableViewCell {
    
    weak var delegate: PostTableViewCellDelegate?
    
    lazy var indexPathCell = IndexPath()
           
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
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(postImageAction)))
        return imageView
    }()
    
    @objc func postImageAction(){
        delegate?.didTapImage(indexPath: indexPathCell)
    }
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBackground
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var likesText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likesIncrease)))
        return label
    }()
    
    @objc func likesIncrease(){
        profilePost[indexPathCell.row].likes += 1
        likesText.text = "Likes: \(profilePost[indexPathCell.row].likes)"
    }
    
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
    
    func setupCell(indexPath: IndexPath) {
        indexPathCell = indexPath
        authorText.text = profilePost[indexPathCell.row].author + " \(indexPathCell)"
        postImageView.image = profilePost[indexPathCell.row].image
        descriptionText.text = profilePost[indexPathCell.row].description
        likesText.text = "Likes: \(profilePost[indexPathCell.row].likes)"
        viewsText.text = "Views: \(profilePost[indexPathCell.row].views)"
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

