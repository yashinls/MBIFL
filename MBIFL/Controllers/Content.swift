//
//  Content.swift
//  MBIFL
//
//  Created by Yashin on 20/01/18.
//  Copyright © 2018 Logicalsteps. All rights reserved.
//

import UIKit
import WebKit
import MobileCoreServices

class Content: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var url: URL?
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleViewImage = UIImageView(image: UIImage(named: "Title_View"))
        self.navigationItem.titleView = titleViewImage
        
        setupPageLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Functions
    
    func setupPageLayout() {
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView)
        self.view.sendSubview(toBack: webView)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: .alignAllCenterX, metrics: nil, views: ["view": webView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: .alignAllCenterY, metrics: nil, views: ["view": webView]))
        
        let request = URLRequest(url: url!)
        webView.load(request)
    }

}


//MARK:- WKNavigationDelegate

extension Content: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
        print("Start to load")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        print("Finish to load")
    }
}
