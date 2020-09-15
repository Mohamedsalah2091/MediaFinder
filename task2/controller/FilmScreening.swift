//
//  WebViewVc.swift
//  task2
//
//  Created by MAK on 3/30/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import WebKit
class FilmScreeningVc: UIViewController {

   
    @IBOutlet weak var myWebView: WKWebView!
    var Url : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.load(URLRequest(url:URL(string:Url)!))
    }
    

    

}
