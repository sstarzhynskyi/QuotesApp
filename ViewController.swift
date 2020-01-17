//
//  ViewController.swift
//  QuotesApp3
//
//  Created by Stanislav Starzhynskyi on 11/01/2020.
//  Copyright © 2020 Stanislav Starzhynskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait

        }
    }
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func tapToGetQuoteAction(_ sender: Any) {
       
        
        getQuote { quotes in
            for item in quotes {
                print(item.qoute + " " + item.author )
                DispatchQueue.main.async {
                    self.quoteLabel.text = item.qoute + " " + item.author
                    self.quoteLabel.textColor = .white
                    self.quoteLabel.sizeToFit()
                     if let phone = URL(string: "tel://\(774178557)"),
            UIApplication.shared.canOpenURL(phone) {
            UIApplication.shared.open(phone, options: [:], completionHandler: nil)
                }
                
            }
            
        }

    }
    let message = "Better Call Stan!\n 774-178-557"
    @IBAction func tapBecomeAPartnerAction(_ sender: Any) {
            quoteLabel.text = message
        quoteLabel.textColor = .green
        quoteLabel.sizeToFit()
            
                
            }
        }
    
    
    
    
  


