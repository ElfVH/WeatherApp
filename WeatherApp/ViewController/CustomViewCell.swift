//
//  CustomViewCell.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 2/7/2564 BE.
//

import UIKit
import SDWebImage

class CustomViewCell: UITableViewCell {
    
    var timeForecasts: [TimeForecastViewModel] = []
    
    @IBOutlet weak var day: UILabel!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        print(timeForecasts.count)
        // Configure the view for the selected state
    }

}

extension CustomViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeForecasts.count
//        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellReuse", for: indexPath) as! CollectionViewCell
//        print(indexPath.row)
        
        let time = timeForecasts[indexPath.row].time
        let icon = timeForecasts[indexPath.row].image
        let temp = timeForecasts[indexPath.row].temp
//
        cell.time.text = time
        cell.icon.sd_setImage(with: icon, placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground, completed: nil)
        cell.temp.text = "\(temp) °C"
//        conditionImageView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground, completed: nil)
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
    }

    
    
}
