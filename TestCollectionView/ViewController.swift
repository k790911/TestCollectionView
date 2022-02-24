//
//  ViewController.swift
//  TestCollectionView
//
//  Created by 김재훈 on 2022/02/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    let viewModel = ImageViewModel()
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.countOfImageList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Cell else { return UICollectionViewCell() }
        
        let imageInfo = viewModel.imageInfo(at: indexPath.item)
        cell.update(info: imageInfo)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageInfo = viewModel.imageInfo(at: indexPath.item)
        
        let dialog = UIAlertController(title: "\(imageInfo.name)", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
        
        dialog.addAction(action)
        
        self.present(dialog, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let width = collectionView.frame.width
        let height = collectionView.frame.height

        return CGSize(width: width/2.05, height: height/4.5)
    }
}
