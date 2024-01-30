//
//  CustomCVCell.swift
//  lesson№6(4-month)repeat
//
//  Created by user on 29/1/24.
//

import UIKit

class CustomCVCell: UICollectionViewCell {
    
    private let indexLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let photoIV: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.addSubview(photoIV)
        contentView.backgroundColor = .cyan
        contentView.layer.cornerRadius = 16
        
        NSLayoutConstraint.activate([
            photoIV.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoIV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoIV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoIV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setIndex(_ index: String) {
        indexLabel.text = index
    }
    
    func setImage(image: String) {
        photoIV.image = UIImage(named: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
