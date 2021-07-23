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
        
        // Configure the view for the selected state
    }

}

extension CustomViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeForecasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellReuse", for: indexPath) as! CollectionViewCell
        let timeForecast = timeForecasts[indexPath.row]
        let time = timeForecast.time
        let icon = timeForecast.image
        let temp = timeForecast.temp
        cell.time.text = time
        cell.icon.sd_setImage(with: icon, placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground, completed: nil)
        cell.temp.text = "\(temp) °C"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
    }
    
}
