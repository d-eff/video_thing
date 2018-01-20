//
//  PlayerView.swift
//  creche
//
//  Created by David F on 1/15/18.
//  Copyright © 2018 Fictional Corp. All rights reserved.
//

import WebKit

class Player: WKWebView {
    
    var html: String = ""
    let magicScalingConstant: CGFloat = 9/16
    
    init(frame: CGRect, video: Video) {
        let config = WKWebViewConfiguration()
        let width = frame.size.width
        let height = width * magicScalingConstant
        super.init(frame: frame, configuration: config)
        html = buildHTML(width: width, height: height, video: video)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func play() {
        self.loadHTMLString(html, baseURL: nil)
    }
    
    func buildHTML(width: CGFloat, height: CGFloat, video: Video) -> String {
        var htmlString = String(format: youtubeHTMLPrefix, width, height)
        if (video.isPlaylist) {
            htmlString.append(String(format: youtubePlaylist, video.id))
        } else {
            htmlString.append(String(format: youtubeVideo, video.id))
        }
        htmlString.append(youtubeSuffix)
        return htmlString
    }
    
    //all props to https://stackoverflow.com/questions/34429042/autoplay-on-video-in-uiwebview-ios for the autoplay
    let youtubeHTMLPrefix = "<!DOCTYPE html><html><head><style>body{margin:0px 0px 0px 0px;}</style></head> <body> <div id=\"player\"></div>" +
        "<script> var tag = document.createElement('script');" +
        "tag.src = \"http://www.youtube.com/player_api\";" +
        "var firstScriptTag = document.getElementsByTagName('script')[0];" +
        "firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);" +
        "var player;" +
        "function onYouTubePlayerAPIReady() {" +
        "player = new YT.Player('player', { width:'%0.0f', height:'%0.0f', videoId: '', events: { 'onReady': onPlayerReady, } });" +
        "}" +
        "function onPlayerReady(event) {"
    let youtubeVideo = "event.target.loadVideoById('%@');"
    let youtubePlaylist = "event.target.loadPlaylist({ 'listType': 'playlist', 'list': '%@', 'index': '0' }); event.target.setShuffle({'shufflePlaylist': 'true'});"
    let youtubeSuffix = "event.target.mute();" +
        "event.target.playVideo();" +
    "} </script> </body> </html>"
}
