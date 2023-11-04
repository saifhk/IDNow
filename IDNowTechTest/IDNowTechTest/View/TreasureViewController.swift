//
//  ViewController.swift
//  IDKnowTechTest
//
//  Created by user on 31/10/2023.
//

import UIKit
import Combine
class TreasureViewController: UIViewController {
 

@IBOutlet weak var treasureImage: UIImageView!
    let viewModel = TreasureViewModel()
    private var cancellables: Set<AnyCancellable> = []
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet weak var TreasureDiversityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func startLookingForTreasure(_ sender: Any) {
        viewModel.$state.sink { [weak self] state in
                  DispatchQueue.main.async {
                      self?.updateUI(for: state)
                  }
              }.store(in: &cancellables)

              fetchData()
    }
    func fetchData() {
       viewModel.fetchTreasure()
   }
    
    func updateUI(for state: TreasureState) {
            switch state {
            case .initial:
                TreasureDiversityLabel.text = "Start"
            case .loading:
                TreasureDiversityLabel.text = "Loading..."
            case .loaded(let treasure):
                messageLabel.text = "\(treasure.message)"
                treasureImage.image = UIImage(named: treasure.type)
                TreasureDiversityLabel.text = "you have found \(treasure.type)"
            case .loadError(let error):
                TreasureDiversityLabel.text = "Error: \(error)"
            }
        }

        deinit {
            cancellables.forEach { $0.cancel() }
        }
}


