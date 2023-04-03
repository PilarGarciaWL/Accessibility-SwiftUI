//
//  Logger.swift
//  StarWarsSad
//
//  Created by Pilar García on 23/3/23.
//

import Combine
import Foundation
import os

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier ?? ""
    
    private static var isInDebugMode: Bool {
    #if DEBUG
        return true
    #else
        return false
    #endif
    }

    static let viewCycle = Logger(subsystem: subsystem, category: "viewCycle")
    static let network = Logger(subsystem: subsystem, category: "network")
    
    static func error(_ message: String, type: LoggerType) {
        switch type {
        case .viewCycle:
            Logger.viewCycle.error("❗️\(message)")
        case .network:
            Logger.network.error("❗️\(message)")
        }
    }
    
    static func info(_ message: String, type: LoggerType) {
        switch type {
        case .viewCycle:
            Logger.viewCycle.info("ℹ️ \(message)")
        case .network:
            Logger.network.info("ℹ️ \(message)")
        }
    }
    
    static func debug(_ message: String, type: LoggerType) {
        if isInDebugMode {
            switch type {
            case .viewCycle:
                Logger.viewCycle.debug("🪲 \(message)")
            case .network:
                Logger.network.debug("🪲 \(message)")
            }
        }
    }
    
    static func success(_ message: String, type: LoggerType) {
        if isInDebugMode {
            switch type {
            case .viewCycle:
                Logger.viewCycle.debug("✅ \(message)")
            case .network:
                Logger.network.debug("✅ \(message)")
            }
        }
    }
    
}

enum LoggerType {
    case viewCycle
    case network
}
