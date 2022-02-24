//
//  Model.swift
//  TestCollectionView
//
//  Created by 김재훈 on 2022/02/23.
//

import Foundation
import UIKit

class Cell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(info: ImageInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
    }
}

struct ImageInfo {
    let name: String
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    init (name: String) {
        self.name = name
    }
}

class ImageViewModel {
    let imageInfoList: [ImageInfo] = [
        ImageInfo(name: "smile1.JPG"),
        ImageInfo(name: "smile2.JPG"),
        ImageInfo(name: "smile3.JPG"),
        ImageInfo(name: "smile1.JPG"),
        ImageInfo(name: "smile2.JPG"),
        ImageInfo(name: "smile3.JPG"),
        ImageInfo(name: "smile1.JPG"),
        ImageInfo(name: "smile2.JPG"),
        ImageInfo(name: "smile3.JPG"),
        ImageInfo(name: "smile1.JPG")
    ]
    
    var countOfImageList: Int {
        return imageInfoList.count
    }
    
    func imageInfo(at index: Int) -> ImageInfo {
        return imageInfoList[index]
    }
}
