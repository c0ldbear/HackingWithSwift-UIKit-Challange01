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
        if let selectedFlag = selectedFlag {
            flagImageView.image = UIImage(named: selectedFlag)
            flagImageView.layer.borderWidth = 1
            flagImageView.layer.borderColor = UIColor.lightGray.cgColor
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        }
    }
    
    @objc func shareTapped(action: UIAlertAction! = nil) {
        guard let image = flagImageView.image?.jpegData(compressionQuality: 1) else {
                  print("No flag or flag image found.")
                  return
              }
        
        let vc = UIActivityViewController(activityItems: [image, flagName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
