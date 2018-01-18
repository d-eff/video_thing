//
//  ViewController.swift
//  creche
//
//  Created by David F on 1/14/18.
//  Copyright © 2018 Fictional Corp. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        
        let areYouFuckingWithMeSwift = NSView(frame: view.frame)
        view.addSubview(areYouFuckingWithMeSwift)
        areYouFuckingWithMeSwift.layer?.backgroundColor = NSColor.black.cgColor
        
        let player = Player(frame: view.frame, videoId: VideoList.pandasLive)
        view.addSubview(player)
        
        player.play()
    }
}

extension ViewController: WKUIDelegate {
    
}

