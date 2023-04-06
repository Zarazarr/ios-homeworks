//
//  GalleryTableViewCell.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 07.03.2023.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {
    
    private var randomInt1 = 0
    private var randomInt2 = 0
    private var randomInt3 = 0
    private var randomInt4 = 0
    
    private let photoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        return label
    }()
    
    lazy var arrowButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        return button
    }()
    
    private lazy var photo1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DSC_00\(randomInt1)")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var photo2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DSC_00\(randomInt2)")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var photo3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DSC_00\(randomInt3)")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var photo4: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DSC_00\(randomInt4)")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
        
    private lazy var whiteView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0.7
        return view
    }()
    
    private lazy var animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        generateRandomFoto()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generateRandomFoto() {
        randomInt1 = Int.random(in: 51...55)
        randomInt2 = Int.random(in: 56...60)
        randomInt3 = Int.random(in: 61...65)
        randomInt4 = Int.random(in: 66...70)
    }
    
    func layout() {
                
        contentView.addSubview(stackView)
        contentView.addSubview(photoLabel)
        contentView.addSubview(arrowButton)
        
        stackView.addArrangedSubview(photo1)
        stackView.addArrangedSubview(photo2)
        stackView.addArrangedSubview(photo3)
        stackView.addArrangedSubview(photo4)
        
        NSLayoutConstraint.activate([
            
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowButton.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            
            photo1.heightAnchor.constraint(equalToConstant: Metrics.imageHeight),
            photo1.widthAnchor.constraint(equalToConstant: Metrics.imageWidth),
            photo2.heightAnchor.constraint(equalToConstant: Metrics.imageHeight),
            photo2.widthAnchor.constraint(equalToConstant: Metrics.imageWidth),
            photo3.heightAnchor.constraint(equalToConstant: Metrics.imageHeight),
            photo3.widthAnchor.constraint(equalToConstant: Metrics.imageWidth),
            photo4.heightAnchor.constraint(equalToConstant: Metrics.imageHeight),
            photo4.widthAnchor.constraint(equalToConstant: Metrics.imageWidth),
            
            stackView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])
    }
}

extension GalleryTableViewCell {
    enum Metrics {
        static let imageWidth = (UIScreen.main.bounds.width - 24 - 24)/4
        static let imageHeight = (UIScreen.main.bounds.width - 24 - 24)/4
    }
}
