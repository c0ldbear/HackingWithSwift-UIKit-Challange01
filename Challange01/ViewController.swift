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
        loadFlags()
    }

    private func loadFlags() {
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return smallFlags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath)
        let tempFlag = smallFlags[indexPath.row]
        if let index = tempFlag.range(of: "@")?.lowerBound {
            let flag = String(tempFlag[..<index])
            cell.imageView?.image = UIImage(named: flag)
            cell.textLabel?.text = flag.count < 3 ? flag.uppercased() : flag.capitalized
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "FlagDetail") as? FlagDetailViewController {
            vc.selectedFlag = bigFlags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

