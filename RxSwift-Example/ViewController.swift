//
//  ViewController.swift
//  RxSwift-Example
//
//  Created by Birapuram Kumar Reddy on 12/22/17.
//  Copyright © 2017 KRiOSApps. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private var example : [Model]!

    override func viewDidLoad() {
        super.viewDidLoad()
        let model1 = Model(title: "Simple Search Bar & UITableView example", desc: "Observable, Observer, Debounce & Filters",segue:"example1")
        example = [Model]()
        example.append(model1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return example.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "simpleCell", for: indexPath) as? SimpleCell {
            let model = example[indexPath.row]
            cell.configure(title: model.title, desc: model.desc)
            return cell
        }else{
            fatalError("unable to extract simpleCell reusable identifier or unable to cast to SimpleCell, please check")
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = example[indexPath.row]
        performSegue(withIdentifier: model.segue, sender: self)
    }
}

struct Model {
    let title : String
    let desc : String
    let segue : String
}

