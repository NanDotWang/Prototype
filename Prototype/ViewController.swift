//
//  ViewController.swift
//  Prototype
//
//  Created by Nan Wang on 2017-11-26.
//  Copyright © 2017 NanTech. All rights reserved.
//

import UIKit
import NetworkingKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let apiService = APIService()

    private var dataProvider = DataProvider() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let loadingViewController = LoadingViewController()
        add(loadingViewController)

        apiService.load(resource: Profile.nearbyUsers) { [weak self] (result) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                loadingViewController.remove()
            }
            switch result {
            case .success(let profile):
                self?.dataProvider = DataProvider(profiles: profile)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let profile = dataProvider.object(at: indexPath)
        cell.textLabel?.text = profile.name
        cell.detailTextLabel?.text = profile.phone

        return cell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
