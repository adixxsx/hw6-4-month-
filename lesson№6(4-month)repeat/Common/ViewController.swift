//
//  ViewController.swift
//  lesson№6(4-month)repeat
//
//  Created by user on 29/1/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    private let arrowLeft: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        btn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    private let simpleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 40, height: 220)
        
        layout.minimumLineSpacing = 20  //отступ между колоннами - line
        layout.minimumInteritemSpacing = 0  //отступ между рядами - cell
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        cv.register(CustomCVCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    private let simpleCollectionView2: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 133)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        
        layout.scrollDirection = .horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        cv.register(CustomCVCell.self, forCellWithReuseIdentifier: "cell2")
        return cv
    }()
    
    
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        
        super.viewDidLoad()
        view.addSubview(simpleCollectionView)
        
        view.addSubview(simpleCollectionView2)
        
        NSLayoutConstraint.activate([
            simpleCollectionView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            simpleCollectionView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            simpleCollectionView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            simpleCollectionView2.bottomAnchor.constraint(equalTo: simpleCollectionView.topAnchor, constant: 5),
            simpleCollectionView2.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            simpleCollectionView.topAnchor.constraint(equalTo: simpleCollectionView2.topAnchor, constant: 170),
            simpleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            simpleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            simpleCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        simpleCollectionView.dataSource = self
        simpleCollectionView2.dataSource = self
        
        
    }
    private func arrowLeftButton() {
        view.addSubview(arrowLeft)
        NSLayoutConstraint.activate([
            arrowLeft.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            arrowLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == simpleCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCVCell
            cell?.setImage(image: "McLovin")
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? CustomCVCell
            cell?.setImage(image: "McLovinAssHole")
            return cell ?? UICollectionViewCell()
        }
    }
    
}
