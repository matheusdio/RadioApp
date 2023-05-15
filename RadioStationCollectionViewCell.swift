//
//  RadioStationCollectionViewCell.swift
//  NativeApp
//
//  Created by Matheus Dionísio on 06/12/22.
//

import UIKit

class RadioStationCollectionViewCell: UICollectionViewCell {
    
    lazy var container: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var stationLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "90.0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 38, weight: .light)
        label.textColor = #colorLiteral(red: 0.7098041177, green: 0.7098038793, blue: 0.7011842132, alpha: 1)
        
        return label
    }()
    
    func setupLayout() {
        
        setHierachy()
        setConstraints()
        
    }
    
    func setHierachy() {
        
        contentView.addSubview(container)
        container.addSubview(stationLabel)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            container.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            stationLabel.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 5),
            stationLabel.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 5),
            stationLabel.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: 5)
        ])
    }
}
