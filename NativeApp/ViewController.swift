//
//  ViewController.swift
//  NativeApp
//
//  Created by Matheus Dionísio on 01/12/22.
//

import UIKit

class ViewController: UIViewController {

    var stationArray: [Station] = []
    var selectedStation: Station?
    var buttonTapped: Bool = false
    
    lazy var container: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9254903197, green: 0.9254902005, blue: 0.9254903197, alpha: 1)
        
        return view
    }()
    
    lazy var radioAppLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "RADIO"
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: 30)
        
        return label
        }()
    
    lazy var configureButton: UIButton = {
        
        let button = UIButton(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "configurationButton"), for: .normal)
        
        return button
    }()
    
    lazy var topSeparatorView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8196079731, green: 0.8196079135, blue: 0.8196079135, alpha: 1)
        
        return view
    }()
    
    lazy var radioImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "radioImage")
        
        return imageView
    }()
 // - DJ container
    lazy var controlMusicButtonsContainerView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9215686321, green: 0.9215685725, blue: 0.9215685725, alpha: 1)
        
        return view
    }()
    
 // - Radio button {Previous}
    
    lazy var previousContainerView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.backgroundColor = #colorLiteral(red: 0.8949970603, green: 0.8900305629, blue: 0.890118897, alpha: 1)
        
        return view
    }()
    
    lazy var previousView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.backgroundColor = #colorLiteral(red: 0.9215684533, green: 0.9215688109, blue: 0.930177629, alpha: 1)
        
        return view
    }()
    
    lazy var previousButton: UIButton = {
        
        let button = UIButton()
        let buttonConfig = UIImage.SymbolConfiguration(pointSize: 80, weight: .bold, scale: .large)
        let buttonImage = UIImage(systemName: "arrowshape.turn.up.backward", withConfiguration: buttonConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = #colorLiteral(red: 0.9294118285, green: 0.9294118285, blue: 0.9294118285, alpha: 1)
        button.setImage(buttonImage, for: .normal)
        button.tintColor = #colorLiteral(red: 0.7843136191, green: 0.784313798, blue: 0.788619101, alpha: 1)
        
        
        return button
    }()
    
// - Play/Stop button ~
    
    lazy var playButtonContainerView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var playButtonView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var playButton: UIButton = {
        
        let button = UIButton()
        let buttonConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
        let buttonImage = UIImage(systemName: "play.circle.fill", withConfiguration: buttonConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = #colorLiteral(red: 0.9294118285, green: 0.9294118285, blue: 0.9294118285, alpha: 1)
        button.setImage(buttonImage, for: .normal)
        button.tintColor = #colorLiteral(red: 0.7843136191, green: 0.784313798, blue: 0.788619101, alpha: 1)
        
        return button
    }()
    
    // - Next
    
    lazy var nextButton: UIButton = {
        
        let button = UIButton()
        let buttonConfig = UIImage.SymbolConfiguration(pointSize: 80, weight: .bold, scale: .large)
        let buttonImage = UIImage(systemName: "arrowshape.turn.up.right", withConfiguration: buttonConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = #colorLiteral(red: 0.9294118285, green: 0.9294118285, blue: 0.9294118285, alpha: 1)
        button.setImage(buttonImage, for: .normal)
        button.tintColor = #colorLiteral(red: 0.7843136191, green: 0.784313798, blue: 0.788619101, alpha: 1)
        
        return button
    }()

    
    lazy var bottomSeparatorView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8313726783, green: 0.8313726187, blue: 0.8313726187, alpha: 1)
        
        return view
    }()
    
    lazy var radioStationViewContainer: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411765337, alpha: 1)
        
        return view
    }()
    
    lazy var radioCollectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.collectionViewLayout = layout
        collectionView.register(RadioStationCollectionViewCell.self, forCellWithReuseIdentifier: "RadioStationCollectionViewCell")
        
        return collectionView
    }()
    
    lazy var radioStationLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Radio Station"
        label.textColor = #colorLiteral(red: 0.4352940321, green: 0.4352940321, blue: 0.4352940321, alpha: 1)
        
       return label
    }()
    
    lazy var stack: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(container)
        self.view.backgroundColor = .white
        self.radioCollectionView.delegate = self
        self.radioCollectionView.dataSource = self
        self.setHierachy()
        self.setConstraints()
        self.createRadioStation()
    }
    
    @objc func buttonAction(sender: UIButton!) {
        if playButton.isTouchInside == true {
            buttonTapped = true
        }
    }
    
    func createRadioStation() {
        
        let radioStation1: Station = Station(stationNumber: "89.1", stationName: "Mokpo-MBC")
        let radioStation2: Station = Station(stationNumber: "91.9", stationName: "MBC FM4U")
        let radioStation3: Station = Station(stationNumber: "103.5", stationName: "SBS Love FM")
        let radioStation4: Station = Station(stationNumber: "107.7", stationName: "SBS Power FM")
        
        stationArray.append(radioStation1)
        stationArray.append(radioStation2)
        stationArray.append(radioStation3)
        stationArray.append(radioStation4)
    }
    
    func setStationName() {
        
    }
    
    func setHierachy() {
        
        container.addSubview(radioAppLabel)
        container.addSubview(configureButton)
        container.addSubview(topSeparatorView)
        container.addSubview(radioImageView)
        container.addSubview(controlMusicButtonsContainerView)
        //controlMusicButtonsContainerView.addSubview(previousContainerView)
        //previousContainerView.addSubview(previousView)
        controlMusicButtonsContainerView.addSubview(previousButton)
        //container.addSubview(playButtonContainerView)
        //container.addSubview(playButtonView)
        controlMusicButtonsContainerView.addSubview(playButton)
        controlMusicButtonsContainerView.addSubview(nextButton)
        container.addSubview(bottomSeparatorView)
        container.addSubview(radioStationViewContainer)
        radioStationViewContainer.addSubview(radioCollectionView)
        radioStationViewContainer.addSubview(radioStationLabel)

    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            container.topAnchor.constraint(equalTo: self.view.topAnchor),
            container.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            radioAppLabel.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 85),
            radioAppLabel.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 155),
            
            configureButton.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 80),
            configureButton.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -30),
            configureButton.widthAnchor.constraint(equalToConstant: 40),
            configureButton.heightAnchor.constraint(equalToConstant: 40),
            
            topSeparatorView.topAnchor.constraint(equalTo: self.radioAppLabel.bottomAnchor, constant: 15),
            topSeparatorView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            topSeparatorView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            topSeparatorView.heightAnchor.constraint(equalToConstant: 2),
            
            radioImageView.topAnchor.constraint(equalTo: self.topSeparatorView.bottomAnchor),
            radioImageView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 5),
            radioImageView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            radioImageView.heightAnchor.constraint(equalToConstant: 500),
            
            controlMusicButtonsContainerView.topAnchor.constraint(equalTo: self.radioImageView.bottomAnchor),
            controlMusicButtonsContainerView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            controlMusicButtonsContainerView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            controlMusicButtonsContainerView.heightAnchor.constraint(equalToConstant: 120),
            
            
            previousButton.topAnchor.constraint(equalTo: self.controlMusicButtonsContainerView.topAnchor, constant: 20),
            previousButton.leadingAnchor.constraint(equalTo: self.controlMusicButtonsContainerView.leadingAnchor, constant: 30),
            previousButton.heightAnchor.constraint(equalToConstant: 60),
            previousButton.widthAnchor.constraint(equalToConstant: 60),
            
            playButton.topAnchor.constraint(equalTo: self.controlMusicButtonsContainerView.topAnchor, constant: 2),
            playButton.leadingAnchor.constraint(equalTo: self.previousButton.leadingAnchor, constant: 115),
            playButton.heightAnchor.constraint(equalToConstant: 100),
            playButton.widthAnchor.constraint(equalToConstant: 100),
            
            nextButton.topAnchor.constraint(equalTo: self.controlMusicButtonsContainerView.topAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: self.controlMusicButtonsContainerView.trailingAnchor, constant: -30),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            nextButton.widthAnchor.constraint(equalToConstant: 60),
            
            bottomSeparatorView.topAnchor.constraint(equalTo: self.controlMusicButtonsContainerView.bottomAnchor),
            bottomSeparatorView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            bottomSeparatorView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            bottomSeparatorView.heightAnchor.constraint(equalToConstant: 2),
            
            radioStationViewContainer.topAnchor.constraint(equalTo: self.bottomSeparatorView.bottomAnchor),
            radioStationViewContainer.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            radioStationViewContainer.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            radioStationViewContainer.bottomAnchor.constraint(equalTo: self.container.bottomAnchor),
            
            radioCollectionView.topAnchor.constraint(equalTo: self.radioStationViewContainer.topAnchor, constant: 10),
            radioCollectionView.leadingAnchor.constraint(equalTo: self.radioStationViewContainer.leadingAnchor, constant: -3),
            radioCollectionView.trailingAnchor.constraint(equalTo: self.radioStationViewContainer.trailingAnchor),
            radioCollectionView.bottomAnchor.constraint(equalTo: self.radioStationViewContainer.bottomAnchor, constant: -65),
            
            radioStationLabel.topAnchor.constraint(equalTo: self.radioCollectionView.bottomAnchor, constant: 5),
            radioStationLabel.leadingAnchor.constraint(equalTo: self.radioStationViewContainer.leadingAnchor, constant: 147),
            //radioStationLabel.trailingAnchor.constraint(equalTo: self.radioStationViewContainer.trailingAnchor, constant: -150)
            
        
            
            
            
        ])
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stationArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RadioStationCollectionViewCell", for: indexPath) as? RadioStationCollectionViewCell
        cell?.setupLayout()
        cell?.stationLabel.text = self.stationArray[indexPath.item].stationNumber
        
        if let selected = selectedStation {
            if selected == stationArray[indexPath.item] {
                
                cell?.stationLabel.textColor = #colorLiteral(red: 0.2176100016, green: 0.40457955, blue: 0.524797678, alpha: 1)
                cell?.stationLabel.font = UIFont.systemFont(ofSize: 48)
                radioStationLabel.text = self.selectedStation?.stationName
            }
            else if buttonTapped == true {
                selectedStation = stationArray[indexPath.item+1]
                
            }
            else {
                cell?.stationLabel.textColor = #colorLiteral(red: 0.6017464995, green: 0.5918241143, blue: 0.6049105525, alpha: 1)
                cell?.stationLabel.font = UIFont.systemFont(ofSize: 38)
           }
        }
        
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.radioCollectionView.frame.width / 3, height: self.radioCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)!
        selectedStation = stationArray[indexPath.item]
        cell.backgroundColor = .none
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)!
        if selectedStation != nil {
            selectedStation = nil
            cell.contentView.backgroundColor = .none
            
        }
    }
}

