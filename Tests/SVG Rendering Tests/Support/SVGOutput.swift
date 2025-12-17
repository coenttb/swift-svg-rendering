// SVGOutput.swift

import Foundation

enum SVGOutput {
    static let directory = "/tmp/svg-tests"

    static func write(_ bytes: [UInt8], name: String) throws -> String {
        let fm = FileManager.default
        try fm.createDirectory(atPath: directory, withIntermediateDirectories: true)
        let path = "\(directory)/\(name).svg"
        try Data(bytes).write(to: URL(fileURLWithPath: path))
        return path
    }

    static func write(_ string: String, name: String) throws -> String {
        try write([UInt8](string.utf8), name: name)
    }
}
