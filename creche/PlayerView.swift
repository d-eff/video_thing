//
//  PlayerView.swift
//  creche
//
//  Created by David F on 1/15/18.
//  Copyright © 2018 Fictional Corp. All rights reserved.
//

import WebKit

class Player: WKWebView {
    //all props to https://stackoverflow.com/questions/34429042/autoplay-on-video-in-uiwebview-ios for the autoplay
    let youTubeVideoHTML: String = "<!DOCTYPE html><html><head><style>body{margin:0px 0px 0px 0px;}</style></head> <body> <div id=\"player\"></div> <script> var tag = document.createElement('script'); tag.src = \"http://www.youtube.com/player_api\"; var firstScriptTag = document.getElementsByTagName('script')[0]; firstScriptTag.parentNode.insertBefore(tag, firstScriptTag); var player; function onYouTubePlayerAPIReady() { player = new YT.Player('player', { width:'%0.0f', height:'%0.0f', videoId:'%@', events: { 'onReady': onPlayerReady, } }); } function onPlayerReady(event) { event.target.playVideo(); } </script> </body> </html>"
    
    var html: String
    
    init(frame: CGRect, videoId: String) {
        let config = WKWebViewConfiguration()
        html = String(format: youTubeVideoHTML, frame.size.width, frame.size.height, videoId)
        super.init(frame: frame, configuration: config)
    }
    
    required init?(coder: NSCoder) {
        html = ""
        super.init(coder: coder)
    }
    
    func play() {
        self.loadHTMLString(html, baseURL: nil)
    }
}
