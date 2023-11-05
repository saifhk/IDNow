//
//  ViewController.swift
//  IDKnowTechTest
//
//  Created by user on 31/10/2023.
//

import UIKit
import Combine

class TreasureViewController: UIViewController {
    var treasureImage = UIImageView()
    let viewModel = TreasureViewModel()
    private var cancellables: Set<AnyCancellable> = []
    private let titleLabel : UILabel = {
        LabelFactory.build(text: "Found your treasure", font: UIFont.boldSystemFont(ofSize: 15),textAlignement: .center, numberOfLine: 0)
    }()
    var treasureTypeLabel : UILabel = {
        LabelFactory.build(text: "", font: UIFont.boldSystemFont(ofSize: 15),textAlignement: .center, numberOfLine: 0)
    }()
    var startBtn  : UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = ThemeColor.primaryColor
        button.layer.cornerRadius = 7
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        button.configuration = configuration
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addConstraint()
    }
    @objc func startLookingForTreasure() {
        viewModel.$state.sink { [weak self] state in
                  DispatchQueue.main.async {
                      self?.updateUI(for: state)
                  }
              }.store(in: &cancellables)
        fetchData()
    }
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}



extension TreasureViewController{
    func fetchData() {
       viewModel.fetchTreasure()
    }
    func updateUI(for state: TreasureState) {
            switch state {
            case .initial:
                treasureTypeLabel.text = "Start"
            case .loading:
                treasureTypeLabel.text = "Loading..."
            case .loaded(let treasure):
                titleLabel.text = "\(treasure.message)"
                treasureImage.image = UIImage(named: treasure.type)
                treasureTypeLabel.text = "the treasure is \(treasure.type)"
            case .loadError(let error):
                treasureTypeLabel.text = "Error: \(error)"
            }
    }
    func addConstraint(){
        startBtn.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        treasureTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        treasureImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        view.addSubview(treasureImage)
        view.addSubview(treasureTypeLabel)
        view.addSubview(startBtn)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    
            treasureImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            treasureImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            treasureImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            treasureImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                    
            treasureTypeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            treasureTypeLabel.topAnchor.constraint(equalTo: treasureImage.bottomAnchor, constant: 20),
            startBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startBtn.topAnchor.constraint(equalTo: treasureTypeLabel.bottomAnchor, constant: 30)
        ])
        startBtn.addTarget(self, action: #selector(startLookingForTreasure), for: .touchUpInside)
    }
}

