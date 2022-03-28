//
//  PhotoListViewModel.swift
//  PhotoAPI
//
//  Created by Maksim Maiorov on 15.03.2022.
//

import UIKit

protocol PhotoListViewModelDelegate: AnyObject {
    func photoLoaded()
}

final class PhotoListViewModel {
    private var photo = [Photo]()
    
    weak var delegate: PhotoListViewModelDelegate?
    
    private let pixelsClient: PixelsClient
    private let imageLoaded: ImageLoader
    
    var currentPage = 0
    
    init() {
        pixelsClient = PixelsClient()
        imageLoaded = ImageLoader()
        
        loadPhotos()
    }
    
    var count: Int {
        return photo.count
    }
    
    func getPhoto(at idx: Int) -> Photo {
        return photo[idx]
    }
    
    func loadPhotos() {
        currentPage += 1
        let feed = PhotoFeed.curated(currentPage: currentPage, perPage: 20)
        pixelsClient.getPhotos(from: feed) { [weak self] (result) in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let photoFeedResult):
                guard let photoResult = photoFeedResult else {
                    return
                }
                strongSelf.photo.append(contentsOf: photoResult.photos)
                strongSelf.delegate?.photoLoaded()
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func loadImage(url: URL, _ completion: @escaping (UIImage?) -> Void) -> UUID? {
        let token = imageLoaded.loadImage(url) { (result) in
            switch result {
            case .success(let image):
                completion(image)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
        return token
    }
    
    func cancel(_ token: UUID?) {
        if let token = token {
            imageLoaded.cancel(token)
        }
    }
}

