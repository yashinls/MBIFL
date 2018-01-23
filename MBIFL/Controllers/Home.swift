//
//  Home.swift
//  MBIFL
//
//  Created by Yashin on 20/01/18.
//  Copyright © 2018 Logicalsteps. All rights reserved.
//

import UIKit

class Home: UIViewController {
    
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var participantsButton: UIButton!
    @IBOutlet weak var sessionsButton: UIButton!
    @IBOutlet weak var activitiesButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var updatesButton: UIButton!
    @IBOutlet weak var aboutUsButton: UIButton!
    @IBOutlet weak var contactUsButton: UIButton!
    
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleViewImage = UIImageView(image: UIImage(named: "Title_View"))
        self.navigationItem.titleView = titleViewImage
        
        mainButton.layer.borderWidth = 1.0
        mainButton.layer.borderColor = UIColor(red: 196/255.0, green: 201/255.0, blue: 205/255.0, alpha: 1.0).cgColor
        
        mainButton.imageView?.contentMode = .scaleAspectFit
        participantsButton.imageView?.contentMode = .scaleAspectFit
        sessionsButton.imageView?.contentMode = .scaleAspectFit
        activitiesButton.imageView?.contentMode = .scaleAspectFit
        registrationButton.imageView?.contentMode = .scaleAspectFit
        updatesButton.imageView?.contentMode = .scaleAspectFit
        aboutUsButton.imageView?.contentMode = .scaleAspectFit
        contactUsButton.imageView?.contentMode = .scaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Functions
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        switch sender {
        case mainButton: url = URL(string: "http://www.mbifl.com/")
        case participantsButton: url = URL(string: "http://app.vignets.com/v/babED4pr")
        case sessionsButton: url = URL(string: "http://app.vignets.com/v/babED4rl")
        case activitiesButton: url = URL(string: "http://app.vignets.com/v/babED4t5")
        case registrationButton: url = URL(string: "http://app.vignets.com/v/babED4uQ")
        case updatesButton: url = URL(string: "http://app.vignets.com/v/babED4wF")
        case aboutUsButton: url = URL(string: "http://app.vignets.com/v/babED4ye")
        case contactUsButton: url = URL(string: "http://app.vignets.com/v/babED4zI")
        default: url = nil
        }
        
        self.performSegue(withIdentifier: "show_content", sender: self)
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_content" {
            let destination = segue.destination as! Content
            destination.url = url
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "show_content", url != nil {
            return false
        }
        return true
    }

}
