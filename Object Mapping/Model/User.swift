//
//  User.swift
//  Object Mapping
//
//  Created by Md. Nasir on 4/6/18.
//  Copyright © 2018 MCC. All rights reserved.
//

import Foundation
import ObjectMapper

class Company:Mappable{
    var name:String?
    var catchPhrase:String?
    var bs:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name         <- map["name"]
        catchPhrase  <- map["catchPhrase"]
        bs  <- map["bs"]
    }
}

class Geo:Mappable
{
    var lat: String?
    var lng:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lat         <- map["lat"]
        lng          <- map["lng"]
    }
}

class Address:Mappable
{
    var street: String?
    var suite:String?
    var city:String?
    var zipcode:String?
    var geo:Geo?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        street         <- map["street"]
        suite          <- map["suite"]
        city           <- map["city"]
        zipcode        <- map["zipcode"]
        geo            <- map["geo"]
        
    }
}

class Customer:Mappable
{
    var id: Int?
    var name: String?
    var username:String?
    var email:String?
    var phone:String?
    var website:String?
    
    var address:Address?
    var company: Company?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id            <- map["id"]
        name          <- map["name"]
        username      <- map["username"]
        email         <- map["email"]
        phone         <- map["phone"]
        website       <- map["website"]
        company        <- map["company"]
        address        <- map["address"]
    }
}

class ChannelListItem:Mappable
{
    var channelId: Int?
    var categoryId: Int?
    var channelName: String?
    var channelLogoURL:String?
    var streamURL:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        channelId         <- map["channel_id"]
        categoryId        <- map["category_id"]
        channelName       <- map["channel_name"]
        channelLogoURL    <- map["channel_logo_url"]
        streamURL         <- map["stream_url"]
    }
}

class ChannelList : Mappable {
    var channel_list : [ChannelListItem]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        channel_list <- map["channel_list"]
    }
    
}
