//
//  GalleryViewController.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 04.03.2023.
//

import UIKit

class GalleryViewController: UIViewController {
    
    private var model: [Int] {
        var array = [Int]()
        for index in 0...19 {
            array.append(index + 1)
        }
        return array
    }
    
    private lazy var goToTopButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("На верх", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.cornerRadius = 20
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToTopButtonAction), for: .touchUpInside)
        return button
    }()
    
    @objc func goToTopButtonAction() {
         collectionView.setContentOffset(.zero, animated: true)
    }
    
    private var initialImageRect: CGRect = .zero

    private let whiteView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0.7
        return view
    }()
    
    private lazy var crossButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(crossButtonAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func crossButtonAction() {
        crossButton.removeFromSuperview()
        whiteView.removeFromSuperview()
        animateImageToInitial(rect: initialImageRect)
    }
    
    private let animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Gallery"
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.backItem?.title = "Назад"

    }
    
    private func animateImageToInitial(rect: CGRect) {
        UIView.animate(withDuration: 0.6) {
            self.animatingImageView.frame = rect
            self.animatingImageView.layer.cornerRadius = 0
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
        }
    }
    
    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(whiteView)
        view.addSubview(animatingImageView)
        view.addSubview(crossButton)

        NSLayoutConstraint.activate([
            crossButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            crossButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            ])
        
        animatingImageView.image = image
        animatingImageView.alpha = 1.0
        animatingImageView.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)
        
        UIView.animate(withDuration: 0.6) {
            let ratio = (self.animatingImageView.image?.size.height)! / (self.animatingImageView.image?.size.width)!
            let imageWidth = UIScreen.main.bounds.width
            let imageHeight = imageWidth * ratio
            if imageHeight > (0.75 * (UIScreen.main.bounds.height)) {
                self.animatingImageView.frame.size = CGSize(
                    width: ((0.75 * (UIScreen.main.bounds.height)) / ratio),
                    height: (0.75 * (UIScreen.main.bounds.height)))
                self.animatingImageView.center = self.view.center
            } else {
                self.animatingImageView.frame.size = CGSize(
                    width: imageWidth,
                    height: imageHeight)
                self.animatingImageView.center = self.view.center
            }
        }
    }
    
    private func layout() {
        view.addSubview(collectionView)
        view.addSubview(goToTopButton)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            goToTopButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            goToTopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            goToTopButton.heightAnchor.constraint(equalToConstant: 40),
            goToTopButton.widthAnchor.constraint(equalToConstant: 100),

        ])
    }
}

extension GalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as! GalleryCollectionViewCell
        cell.setupCell()
        cell.photo.image = UIImage(named: "DSC_00\(51 + indexPath.item)")
        cell.delegate = self
        cell.setIndexPath(indexPath)
        return cell
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    private var sideInset: CGFloat { return 8 }
    private var elementCount: CGFloat { return 3 }
    private var insetsCount: CGFloat { return elementCount + 1 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * insetsCount) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: .zero, right: sideInset)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let atributes = collectionView.layoutAttributesForItem(at: [0,0])
        let height = atributes!.size.height
        if collectionView.contentOffset.y < ((1 * height) / 4) {
            goToTopButton.isHidden = true
        } else {
            goToTopButton.isHidden = false
            var alpha = (collectionView.contentOffset.y)/100
            if alpha > 1 {
                alpha = 1
            }
            goToTopButton.alpha = alpha
          }
    }
}


extension GalleryViewController: CustomCollectionViewCellDelegate {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
        let atributes = collectionView.layoutAttributesForItem(at: indexPath)
        let rectCell = atributes?.frame
        let rectInSuperView = collectionView.convert(rectCell!, to: collectionView.superview)
        initialImageRect = CGRect(x: frameImage.origin.x + rectInSuperView.origin.x,
                                  y: frameImage.origin.y + rectInSuperView.origin.y,
                                  width: frameImage.width,
                                  height: frameImage.height)
        
        animateImage(image, imageFrame: initialImageRect)
    }
}
