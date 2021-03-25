//
//  Helper.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 03/01/2021.
//

import SwiftUI
import AVKit

var videoPlayer : AVPlayer?

func playVideo(fileName:String, fileFormat:String)->AVPlayer{
    
    if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat){
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    return videoPlayer!
}
