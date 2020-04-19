//
//  GBAvatarImageView.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 14/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class GBAvatarImageView: UIImageView {
    private let cache = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
        image = #imageLiteral(resourceName: "avatar-placeholder")
    }
    
    func downloadImage(from urlString: String) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlString.url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if error != nil { return }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        
        task.resume()
    }
}
