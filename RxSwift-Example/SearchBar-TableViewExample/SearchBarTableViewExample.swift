//
//  SearchBarTableViewExample.swift
//  RxSwift-Example
//
//  Created by Birapuram Kumar Reddy on 12/22/17.
//  Copyright © 2017 KRiOSApps. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchBarTableViewExample: UIViewController {

    let allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"]
    var searchCityNames : [String]!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        searchCityNames = allCities
        _ = self.allCities.filter({$0.hasPrefix("one")})
        searchBar
        .rx.text
            .orEmpty
            .debounce(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext:{ [unowned self] query in
                                        self.searchCityNames = self.allCities.filter({ $0.hasPrefix(query)})
                                        self.tableView.reloadData()
                                        })
            .disposed(by: disposeBag)
    }
}

extension SearchBarTableViewExample : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchCityNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as? CityCell else {
            fatalError("unable to find cityCell")
        }
        cell.configure(cityName: searchCityNames[indexPath.row])
        return cell
    }
}

