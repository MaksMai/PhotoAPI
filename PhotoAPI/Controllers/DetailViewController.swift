//
//  DetailViewController.swift
//  PhotoAPI
//
//  Created by Maksim Maiorov on 15.03.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var photo: Photo?
    
    private lazy var imageV: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        
        return v
    }()
    
    private lazy var closeButtion: UIButton = {
        let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.setTitle("X", for: .normal)
        v.setTitleColor(.white, for: .normal)
        v.addTarget(self, action: #selector(didTapCloseButton(sender:)), for: .touchUpInside)
        
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(imageV)
        view.addSubview(closeButtion)
        
        NSLayoutConstraint.activate([
            
            closeButtion.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            closeButtion.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            closeButtion.widthAnchor.constraint(equalToConstant: 40),
            closeButtion.heightAnchor.constraint(equalToConstant: 40),
            
            imageV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageV.topAnchor.constraint(equalTo: view.topAnchor),
            imageV.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        if let url = URL(string: photo?.src.portrait ?? "") {
            _ = ImageLoader().loadImage(url, { (result) in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        self.imageV.image = image
                    }
                    
                case .failure(let error):
                    print(error)
                }
            })
        }
    }
    
    @objc func didTapCloseButton(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
