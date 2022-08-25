//
//  ViewController.swift
//  Challange01
//
//  Created by teddy on 2022-08-25.
//

import UIKit

class ViewController: UITableViewController {
    
    private var smallFlags = [String]()
    private var bigFlags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup for Table View
        title = "Flag Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Load flags from app bundle
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        var tempSmallFlags = [String]()
        var tempBigFlags = [String]()
        
        for item in items {
            if item.hasSuffix("2x.png") {
                tempSmallFlags.append(item)
            } else if item.hasSuffix("3x.png") {
                tempBigFlags.append(item)
            }
        }
        
        smallFlags = tempSmallFlags.sorted()
        bigFlags = tempBigFlags.sorted()
        print("Small flags: \(smallFlags)")
        print("Big flags: \(bigFlags)")
    }


}

