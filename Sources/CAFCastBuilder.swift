//
//  CAFCastBuilder.swift
//  KalturaNetKit
//
//  Created by Nilit Danan on 10/4/18.
//

import UIKit
import GoogleCast

/**
 CAFCastBuilder this component will help you to communicate with Kaltura-custom-receiver.
 */
@objc public class CAFCastBuilder: BasicCastBuilder {
    
    internal var ks: String?
    internal var kalturaAssetType: CAFKalturaAssetType = .media
    internal var assetReferenceType: CAFAssetReferenceType = .media
    internal var playbackContextType: CAFPlaybackContextType = .playback
    internal var httpProtocol: CAFHttpProtocol = .https
    internal var urlType: CAFUrlType = .playmanifest
    internal var streamerType: CAFStreamerType?
    internal var formats: [String]?
    internal var fileIds: String?
    internal var textLanguage: String?
    internal var audioLanguage: String?
    internal var adTagType: CAFAdTagType = .unset
    
    @objc public enum CAFKalturaAssetType: Int, CustomStringConvertible {
        case media
        case epg
        case recording
        
        public var description: String {
            switch self {
            case .media: return "media"
            case .epg: return "epg"
            case .recording: return "recording"
            }
        }
    }
    
    @objc public enum CAFAssetReferenceType: Int, CustomStringConvertible {
        case media
        case epgInternal
        case epgExternal
        
        public var description: String {
            switch self {
            case .media: return "media"
            case .epgInternal: return "epg_internal"
            case .epgExternal: return "epg_external"
            }
        }
    }
    
    @objc public enum CAFPlaybackContextType: Int, CustomStringConvertible {
        case trailer
        case catchup
        case startOver
        case playback
        
        public var description: String {
            switch self {
            case .trailer: return "TRAILER"
            case .catchup: return "CATCHUP"
            case .startOver: return "START_OVER"
            case .playback: return "PLAYBACK"
            }
        }
    }
    
    @objc public enum CAFHttpProtocol: Int, CustomStringConvertible {
        case https
        case http
        case all
        
        public var description: String {
            switch self {
            case .http: return "http"
            case .https: return "https"
            case .all: return "all"
            }
        }
    }
    
    @objc public enum CAFUrlType: Int, CustomStringConvertible {
        case playmanifest
        case direct
        
        public var description: String {
            switch self {
            case .playmanifest: return "PLAYMANIFEST"
            case .direct: return "DIRECT"
            }
        }
    }

    @objc public enum CAFStreamerType: Int, CustomStringConvertible {
        case mpegdash
        case applehttp
        case url
        case smothstreaming
        case none
        
        public var description: String {
            switch self {
            case .mpegdash: return "mpegdash"
            case .applehttp: return "applehttp"
            case .url: return "url"
            case .smothstreaming: return "smothstreaming"
            case .none: return "none"
            }
        }
    }
    
    @objc public enum CAFAdTagType: Int, CustomStringConvertible {
        case vmap
        case vast
        case unset
        
        public var description: String {
            switch self {
            case .vmap: return "vmap"
            case .vast: return "vast"
            case .unset: return "<unset>"
            }
        }
    }
    
    // MARK: - Set - Kaltura Data
    
    /**
     Set - ks
     - Parameter ks: The ks which represent the user key, used by the Kaltura Web Player
     */
    @discardableResult
    @objc public func set(ks:String?) -> Self {
        
        guard ks != nil, ks?.isEmpty == false else {
                PKGCLog.debug("Trying to set nil or empty string to ks")
                return self
        }
        
        self.ks = ks
        return self
    }
    
    /**
     Set - kalturaAssetType
     - Parameter kalturaAssetType: The kaltura asset type of the media, used by the Kaltura Web Player. (Default .media)
     */
    @discardableResult
    @objc public func set(kalturaAssetType: CAFKalturaAssetType) -> Self {
        
        self.kalturaAssetType = kalturaAssetType
        return self
    }
    
    /**
     Set - assetReferenceType
     - Parameter assetReferenceType: The asset type of the media, used by the Kaltura Web Player. (Default .media)
     */
    @discardableResult
    @objc public func set(assetReferenceType: CAFAssetReferenceType) -> Self {
        
        self.assetReferenceType = assetReferenceType
        return self
    }
    
    /**
     Set - playbackContextType
     - Parameter playbackContextType: The context type of the media, used by the Kaltura Web Player. (Default .playback)
     */
    @discardableResult
    @objc public func set(playbackContextType: CAFPlaybackContextType) -> Self {
        
        self.playbackContextType = playbackContextType
        return self
    }
    
    /**
     Set - httpProtocol
     - Parameter httpProtocol: The protocol, used by the Kaltura Web Player. (Default .https)
     */
    @discardableResult
    @objc public func set(httpProtocol: CAFHttpProtocol) -> Self {
        
        self.httpProtocol = httpProtocol
        return self
    }
    
    /**
     Set - urlType
     - Parameter urlType: The urlType , used by the Kaltura Web Player. (Default .playmanifest)
     */
    @discardableResult
    @objc public func set(urlType: CAFUrlType) -> Self {
        
        self.urlType = urlType
        return self
    }
    
    /**
     Set - streamerType
     - Parameter streamerType: The streamerType, used by the Kaltura Web Player.
     */
    @discardableResult
    @objc public func set(streamerType: CAFStreamerType) -> Self {
        
        self.streamerType = streamerType
        return self
    }
    
    /**
     Set - formats
     - Parameter formats: An array of formats, used by the Kaltura Web Player.
     */
    @discardableResult
    @objc public func set(formats: [String]?) -> Self {
        
        guard formats != nil else {
            PKGCLog.debug("Trying to set nil to formats")
            return self
        }
        
        self.formats = formats
        return self
    }
    
    /**
     Set - fileIds
     - Parameter fileIds: The format ids seperated by commas ("fileId,fileId,..."), used by the Kaltura Web Player.
     */
    @discardableResult
    @objc public func set(fileIds: String?) -> Self {
        
        guard fileIds != nil else {
            PKGCLog.debug("Trying to set nil to fileIds")
            return self
        }
        
        self.fileIds = fileIds
        return self
    }
    
    /**
     Set - textLanguage
     - Parameter textLanguage: The preferred text language, used by the Kaltura Web Player.
     */
    @discardableResult
    @objc public func set(textLanguage: String?) -> Self {
        
        guard textLanguage != nil else {
            PKGCLog.debug("Trying to set nil to textLanguage")
            return self
        }
        
        self.textLanguage = textLanguage
        return self
    }
    
    /**
     Set - audioLanguage
     - Parameter audioLanguage: The preferred audio language, used by the Kaltura Web Player.
     */
    @discardableResult
    @objc public func set(audioLanguage: String?) -> Self {
        
        guard audioLanguage != nil else {
            PKGCLog.debug("Trying to set nil to audioLanguage")
            return self
        }
        
        self.audioLanguage = audioLanguage
        return self
    }
    
    /**
     Set - adTagType
     - Parameter adTagType: The adTagURL type, vast/vmap. This is only requierd when providing the adTagURL
     */
    @discardableResult
    @objc public func set(adTagType: CAFAdTagType) -> Self {
        
        self.adTagType = adTagType
        return self
    }
    
    // MARK: -
    
    override func validate() throws {
        
        try super.validate()
        
        if self.adTagType == .unset, self.adTagURL != nil {
            throw BasicCastBuilder.BasicBuilderDataError.missingAdTagType
        }
        
        if self.adTagType != .unset, self.adTagURL == nil {
            throw BasicCastBuilder.BasicBuilderDataError.missingAdTagURL
        }
    }
    
    // MARK: - Create custom data
    
    override func customData() -> [String:Any]? {
        
        var customData: [String:Any] = [:]
        
        customData["mediaInfo"] = mediaInfoData()
        
        switch self.adTagType {
        case .vmap:
            if self.adTagURL != nil {
                customData["vmapAdsRequest"] = vmapAdData()
            }
        case .vast:
            if self.adTagURL != nil {
                createAdBreaksAndClips()
            }
        case .unset:
            break
        }
        
        if let textLanguage = self.textLanguage {
            customData["textLanguage"] = textLanguage
        }
        
        if let audioLanguage = self.audioLanguage {
            customData["audioLanguage"] = audioLanguage
        }
        
        return customData
    }
    
    internal func mediaInfoData() -> [String:Any] {
        
        var mediaInfoData: [String:Any] = [:]
        
        mediaInfoData["entryId"] = self.contentId
        
        if let ks = self.ks {
            mediaInfoData["ks"] = ks
        }
        
        mediaInfoData["mediaType"] = self.kalturaAssetType.description
        mediaInfoData["assetReferenceType"] = self.assetReferenceType.description
        mediaInfoData["contextType"] = self.playbackContextType.description
        mediaInfoData["protocol"] = self.httpProtocol.description
        mediaInfoData["urlType"] = self.urlType.description
        
        if let streamerType = streamerType?.description {
            mediaInfoData["streamerType"] = streamerType
        }
        
        if let formats = self.formats {
            mediaInfoData["formats"] = formats
        }
        
        if let fileIds = self.fileIds {
            mediaInfoData["fileIds"] = fileIds
        }
        
        return mediaInfoData
    }
    
    internal func vmapAdData() -> [String:Any] {
        
        var vmapAdData: [String:Any] = [:]
        
        vmapAdData["adTagUrl"] = self.adTagURL
        
        return vmapAdData
    }
    
    internal func createAdBreaksAndClips() {
        
        guard let adTagURL = self.adTagURL else {
            return
        }
        
        let adBreakClipId = UUID().uuidString
        let adBreakId = UUID().uuidString
        
        let adBreakInfoBuilder = GCKAdBreakInfoBuilder(adBreakID: adBreakId, adBreakClipIds: [adBreakClipId])
        adBreakInfoBuilder.playbackPosition = 0
        let adBreakInfo = adBreakInfoBuilder.build()
        self.adBreaks = [adBreakInfo]
        
        let adBreakClipInfoBuilder = GCKAdBreakClipInfoBuilder(adBreakClipID: adBreakClipId)
        let vastAdsRequest = GCKVASTAdsRequest(adTagURL: URL(string: adTagURL), adsResponse: nil)
        adBreakClipInfoBuilder.vastAdsRequest = vastAdsRequest
        let adBreakClipInfo = adBreakClipInfoBuilder.build()
        self.adBreakClips = [adBreakClipInfo]
    }
}
