internal import Testing
@testable private import MySwiftUI

struct HostingViewTransparentBackgroundReasonTests {
    @Test func test_description() {
        let none = HostingViewTransparentBackgroundReason(rawValue: 0)
        #expect(none.description == "[]")
        
        let def = HostingViewTransparentBackgroundReason.default
        #expect(def.description == "[default]")
        
        let catalystSidebar = HostingViewTransparentBackgroundReason.catalystSidebar
        #expect(catalystSidebar.description == "[catalystSidebar]")
        
        let catalystPresentation = HostingViewTransparentBackgroundReason.catalystPresentation
        #expect(catalystPresentation.description == "[catalystPresentation]")
        
        let legacyPresentationSPI = HostingViewTransparentBackgroundReason.legacyPresentationSPI
        #expect(legacyPresentationSPI.description == "[legacyPresentationSPI]")
        
        let containerBackground = HostingViewTransparentBackgroundReason.containerBackground
        #expect(containerBackground.description == "[containerBackground]")
        
        let listItemBackground = HostingViewTransparentBackgroundReason.listItemBackground
        #expect(listItemBackground.description == "[listItemBackground]")
        
        let all: HostingViewTransparentBackgroundReason = [
            .default,
            .catalystSidebar,
            .catalystPresentation,
            .legacyPresentationSPI,
            .containerBackground,
            .listItemBackground
        ]
        #expect(all.description == "[default, catalystSidebar, catalystPresentation, legacyPresentationSPI, containerBackground, listItemBackground]")
        
        let combo: HostingViewTransparentBackgroundReason = [.default, .catalystPresentation, .containerBackground]
        #expect(combo.description == "[default, catalystPresentation, containerBackground]")
    }
}
