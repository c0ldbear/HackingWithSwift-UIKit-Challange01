//
//  FlagDetailViewController.swift
//  Challange01
//
//  Created by teddy on 2022-08-26.
//

import UIKit

class FlagDetailViewController: UIViewController {
    @IBOutlet var flagImageView: UIImageView!
    
    var selectedFlag: String?
    private var flagName: String {
        if let selectedFlag = selectedFlag,
            let index = selectedFlag.range(of: "@")?.lowerBound {
            let flag = String(selectedFlag[..<index])
            return flag.count < 3 ? flag.uppercased() : flag.capitalized
        }
        return ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = flagName
        flagImageView.layer.borderWidth = 1
        flagImageView.layer.borderColor = UIColor.lightGray.cgColor
        flagImageView.image = UIImage(named: selectedFlag!)
        
    }
}
