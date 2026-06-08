
import Foundation
import SwiftUI

enum PlatformCheck {
    static var isVisionOS: Bool {
        #if os(visionOS)
            return true
        #else
            return false
        #endif
    }
}
