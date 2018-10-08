//
//  ChannelListViewModel.swift
//  mcpttapp
//
//  Created by Toor, Sanju on 04/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation

struct Channel {
    let channelID: String?
    let channelStatus: String?
    let channelName: String?
    let channelThumbnailImageName: String?
    let channelIconImageName: String?
    let newReceiveddMessagecount: String?
    let missedPTTCount: String?
    let pttCallIconImageName: String?
    let broadcastMessageImageName: String?
    let channelStatusDescription: String?
}

class ChannelListViewModel {
    private init() {}
    static let shared = ChannelListViewModel()

    func fetchChannelData (completion: @escaping ([Channel], [Channel]) -> ()) {

            if let path = Bundle.main.path(forResource: "channelListDemoData", ofType: "json") {
            do {
                var idlechannelsData = [Channel]()
                var activechannelsData = [Channel]()

                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                print(data)
                let jsonResult = try JSONSerialization.jsonObject(with: data,
                                                                  options: JSONSerialization.ReadingOptions.mutableLeaves) as? Dictionary<String, AnyObject>

                let channels = jsonResult?["channels"] as? [[String: String]]
                for channel in channels ?? [[:]] {

                    let channel = Channel(channelID: channel["channel_id"],
                                          channelStatus: channel["channel_Status"],
                                          channelName: channel["channel_name"],
                                          channelThumbnailImageName: channel["channel_status_image_name"],
                                          channelIconImageName: channel["channel_icon_image_Name"],
                                          newReceiveddMessagecount: channel["new_received_message_count"],
                                          missedPTTCount: channel["missed_ptt_call_count"],
                                          pttCallIconImageName: channel["ptt_call_icon_image_name"],
                                          broadcastMessageImageName: channel["broadcast_message_call_status_image"],
                                          channelStatusDescription: channel["channel_description_status"])

                    if(channel.channelStatus == "active") {
                        activechannelsData.append(channel)
                    } else {
                        idlechannelsData.append(channel)
                    }
                }

                DispatchQueue.main.async {
                    completion(idlechannelsData, activechannelsData)
                }
            } catch {
            }
        }
    }
}
