//
//  HomeViewController.swift
//  PhotoAPI
//
//  Created by Maksim Maiorov on 11.03.2022.
//

import UIKit

class HomeViewController: UIViewController {
 
    lazy var photoList: PhotoListView = {
        let v = PhotoListView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.delegate = self
        
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupView()
    }
    
    func setupView() {
        view.addSubview(photoList)
        setupConstrains()
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            photoList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoList.topAnchor.constraint(equalTo: view.topAnchor),
            photoList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: PhotoListItemDelegate {
    func selectedPhoto(photo: Photo) {
        let vc = DetailViewController()
        vc.photo = photo
        present(vc, animated: true, completion: nil)
    }
}
