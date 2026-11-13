//
//  ShaderViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 11/13/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView: View {
    @State private var plays = 0
    
    private var style: SpiderverseStyle {
        SpiderverseStyle(effects: .all, intensity: 1.15, framesPerSecond: 12, palette: .miles, haptics: true)
    }
    
    var body: some View {
        Circle()
            .stroke(
                Color.white,
                style: StrokeStyle(
                    lineWidth: 20,
                    lineCap: .round,
                    lineJoin: .miter,
                    miterLimit: 0,
                    dash: [5, 20],
                    dashPhase: 0
                )
            )
            .spiderversify(trigger: plays, duration: 2, style: style)
            .task {
                do {
                    while true {
                        self.plays &+= 1
                        try await Task.sleep(for: .seconds(2))
                    }
                } catch {}
            }
    }
}

final class ShaderViewController : UIViewController {
    @ViewLoading private var hostingController: UIHostingController<MyView>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: MyView())
        self.hostingController = hostingController
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}



// MARK: - Spiderversify Style source (MIT; Copyright (c) 2023 Jaeho Yoo)
/// The ingredients of the Spider-Verse look. Combine them freely.
fileprivate struct SpiderverseEffects: OptionSet, Sendable {
    
    fileprivate let rawValue: Int
    
    fileprivate init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /// Offset ink ghosts and a red/blue channel split, like a comic page printed out of register.
    fileprivate static let misprint = SpiderverseEffects(rawValue: 1 << 0)
    /// Ben-Day dots inside the first ink ghost.
    fileprivate static let halftone = SpiderverseEffects(rawValue: 1 << 1)
    /// Diagonal hatching inside the second ink ghost.
    fileprivate static let stripes = SpiderverseEffects(rawValue: 1 << 2)
    /// Horizontal bands torn sideways, like a glitch between dimensions.
    fileprivate static let slices = SpiderverseEffects(rawValue: 1 << 3)
    /// Small shakes and tilts, held for each frame.
    fileprivate static let jitter = SpiderverseEffects(rawValue: 1 << 4)
    /// Swaps the font design and weight every frame. Only affects `Text`, and may change its width.
    fileprivate static let typeface = SpiderverseEffects(rawValue: 1 << 5)
    /// A jagged dimensional portal behind the view.
    fileprivate static let portal = SpiderverseEffects(rawValue: 1 << 6)
    
    fileprivate static let glitch: SpiderverseEffects = [.misprint, .halftone, .stripes, .slices, .jitter]
    fileprivate static let all: SpiderverseEffects = [.glitch, .typeface, .portal]
}

/// Two inks that the misprint ghosts and the portal are drawn with.
fileprivate struct SpiderversePalette: Sendable {
    
    let inks: [Ink]
    
    struct Ink: Sendable {
        let first: Color
        let second: Color
    }
    
    /// Always draws with these two inks.
    fileprivate static func custom(_ first: Color, _ second: Color) -> SpiderversePalette {
        SpiderversePalette(inks: [Ink(first: first, second: second)])
    }
    
    fileprivate static let miles = custom(Color(red: 0.93, green: 0.11, blue: 0.20), Color(red: 0.00, green: 0.73, blue: 0.93))
    fileprivate static let gwen = custom(Color(red: 1.00, green: 0.33, blue: 0.67), Color(red: 0.18, green: 0.85, blue: 0.80))
    fileprivate static let hobie = custom(Color(red: 1.00, green: 0.84, blue: 0.00), Color(red: 0.90, green: 0.00, blue: 0.50))
    fileprivate static let prowler = custom(Color(red: 0.45, green: 0.20, blue: 0.85), Color(red: 0.25, green: 0.90, blue: 0.40))
    
    /// Picks one of the built-in palettes each time the effect starts.
    fileprivate static let random = SpiderversePalette(inks: [miles, gwen, hobie, prowler].flatMap(\.inks))
    
    func pick() -> Ink {
        inks.randomElement()!
    }
}

/// How `spiderversify` looks and moves.
fileprivate struct SpiderverseStyle: Sendable {
    
    fileprivate var effects: SpiderverseEffects
    /// Scales every offset, tear and shake. 1 is the default strength.
    fileprivate var intensity: Double
    /// How often the glitch changes. 12 animates "on twos", like Miles in the films.
    fileprivate var framesPerSecond: Double
    fileprivate var palette: SpiderversePalette
    /// Taps once for each portal ring as it appears.
    fileprivate var haptics: Bool
    
    fileprivate init(
        effects: SpiderverseEffects = .glitch,
        intensity: Double = 1,
        framesPerSecond: Double = 12,
        palette: SpiderversePalette = .random,
        haptics: Bool = true
    ) {
        self.effects = effects
        self.intensity = intensity
        self.framesPerSecond = framesPerSecond
        self.palette = palette
        self.haptics = haptics
    }
    
    fileprivate static let `default` = SpiderverseStyle()
    fileprivate static let subtle = SpiderverseStyle(effects: [.misprint, .halftone], intensity: 0.5)
    fileprivate static let portal = SpiderverseStyle(effects: [.portal, .misprint, .halftone, .jitter])
}
// MARK: - Spiderversify Effect source (MIT; Copyright (c) 2023 Jaeho Yoo)
fileprivate struct SpiderversifyEffect: ViewModifier {
    
    let isActive: Bool
    /// Bumping this restarts the effect even while it is already active.
    let activation: Int
    let style: SpiderverseStyle
    
    @Environment(\.accessibilityReduceMotion) fileprivate var reduceMotion
    @Environment(\.colorScheme) fileprivate var colorScheme
    @State fileprivate var session: Session?
    @State fileprivate var phase: Phase = .idle
    /// How many portal rings have appeared, 0...9. They arrive one after another when the effect starts.
    @State fileprivate var shownRings = 0
    /// How many layers have gone again, rim first, 0...10. They leave the same way once the effect ends.
    @State fileprivate var removedRings = 0
    
    fileprivate static let library = ShaderLibrary.default
    fileprivate static let designs: [Font.Design] = [.default, .serif, .monospaced, .rounded]
    fileprivate static let weights: [Font.Weight] = [.ultraLight, .thin, .light, .regular, .medium, .semibold, .bold, .heavy, .black]
    
    /// Picked once per activation, so colors never flash between frames.
    struct Session {
        let start = Date()
        let salt = Float.random(in: 0..<100)
        let sides = Float(Int.random(in: 6...8))
        /// Radians each portal ring turns relative to the one in front of it.
        let twist = Float.random(in: 0.3...0.45) * (Bool.random() ? 1 : -1)
        /// Where the portal's vanishing point sits, in units of its radius.
        let drift: (x: Float, y: Float) = {
            let angle = Float.random(in: 0..<(2 * .pi))
            return (0.5 * cos(angle), 0.5 * sin(angle))
        }()
        let ink: SpiderversePalette.Ink
        
        init(_ style: SpiderverseStyle) {
            ink = style.palette.pick()
        }
    }
    
    struct Frame {
        let index: Int
        let seed: Float
        /// Seconds since the session started, stepped at the frame rate so the portal flows in the same beats as the glitch.
        let time: Double
        let envelope: Double
    }
    
    fileprivate static let portalRings = 9
    fileprivate static let ringInterval: Duration = .milliseconds(50)
    /// How long the portal takes to collapse, and the glitch to fade with it.
    fileprivate static let closeDuration: TimeInterval = 0.05 * Double(portalRings + 1)
    
    fileprivate enum Phase: Equatable {
        case idle
        /// Rings arrive one by one while the glitch plays.
        case opening(Date)
        /// The glitch fades and the portal collapses rim first before the session ends.
        case closing(Date)
    }
    
    fileprivate struct ActivationKey: Equatable {
        let isActive: Bool
        let activation: Int
    }
    
    fileprivate struct RevealKey: Equatable {
        let phase: Phase
        let portal: Bool
    }
    
    func body(content: Content) -> some View {
        // Clamped so a zero or infinite rate can't stall the timeline or overflow the frame index.
        let fps = min(max(style.framesPerSecond, 1), 120)
        TimelineView(.animation(minimumInterval: 1 / fps, paused: session == nil || reduceMotion)) { context in
            let frame = session.map { frame(of: $0, at: context.date, fps: fps) } ?? Frame(index: 0, seed: 0, time: 0, envelope: 0)
            glitched(content, session: session, frame: frame, shown: shownRings, removed: removedRings)
        }
        .onChange(of: ActivationKey(isActive: isActive, activation: activation), initial: true) { _, key in
            if key.isActive {
                session = Session(style)
                phase = .opening(Date())
            } else if session != nil, !reduceMotion {
                phase = .closing(Date())
            } else {
                session = nil
                phase = .idle
            }
        }
        // One layer every 50 ms, each as its own state change, so every layer gets exactly one tap.
        .task(id: RevealKey(phase: phase, portal: style.effects.contains(.portal))) {
            switch phase {
            case .idle:
                shownRings = 0
                removedRings = 0
            case .opening:
                guard style.effects.contains(.portal) else { return }
                removedRings = 0
                shownRings = reduceMotion ? Self.portalRings : 0
                while shownRings < Self.portalRings {
                    try? await Task.sleep(for: Self.ringInterval)
                    if Task.isCancelled { return }
                    shownRings += 1
                }
            case .closing:
                // The rim goes first, then each ring, outermost to deepest.
                while removedRings < Self.portalRings + 1 {
                    try? await Task.sleep(for: Self.ringInterval)
                    if Task.isCancelled { return }
                    removedRings += 1
                }
                session = nil
                phase = .idle
            }
        }
    }
    
    fileprivate func frame(of session: Session, at date: Date, fps: Double) -> Frame {
        let elapsed = max(date.timeIntervalSince(session.start), 0)
        // Reduce Motion holds one still frame instead of flickering.
        let index = reduceMotion ? 0 : Int(elapsed * fps)
        // The glitch runs at full strength, then tapers off across the closing phase as the portal collapses.
        var envelope = 1.0
        if case .closing(let since) = phase {
            envelope = max(0, 1 - date.timeIntervalSince(since) / Self.closeDuration)
        }
        // Wrapped so long continuous runs keep the shader hashes within float precision.
        return Frame(index: index, seed: session.salt + Float(index % 1024), time: Double(index) / fps, envelope: envelope)
    }
    
    /// Keeps the content in a stable view tree whether or not it is glitching, so its state survives.
    fileprivate func glitched(_ content: Content, session: Session?, frame: Frame, shown: Int, removed: Int) -> some View {
        let effects = style.effects
        let moving = session != nil && !reduceMotion
        let noise = Noise(seed: frame.seed)
        let shake = moving && effects.contains(.jitter) ? 4 * style.intensity * frame.envelope : 0
        let tilt = moving && effects.contains(.jitter) ? 3 * style.intensity * frame.envelope : 0
        let portalOn = session != nil && effects.contains(.portal)
        // Opening and closing both count up, so every layer is one step and one tap.
        let step = portalOn && style.haptics ? RingStep(count: shown + removed, layer: removed > 0 ? removed : shown) : RingStep(count: 0, layer: 0)
        
        return shaded(content, session: session, frame: frame)
            .offset(CGSize(width: noise.signed(3) * shake, height: noise.signed(4) * shake))
            .rotationEffect(.degrees(noise.signed(5) * tilt))
            .background {
                if let session, portalOn {
                    portal(session: session, frame: frame, shown: shown, removed: removed)
                }
            }
            .modifier(RingHaptics(step: step))
    }
    
    /// The typeface swap and the two shader passes, padded so the ghosts and tears have room to spill.
    fileprivate func shaded(_ content: Content, session: Session?, frame: Frame) -> some View {
        let effects = style.effects
        let moving = session != nil && !reduceMotion
        var swapping = moving && effects.contains(.typeface)
        if case .closing = phase {
            swapping = false
        }
        let maxOffset = 7 * style.intensity
        let maxTear = 14 * style.intensity
        let padding = ceil(maxOffset + maxTear)
        let ghosts = session != nil && !effects.isDisjoint(with: [.misprint, .halftone, .stripes])
        let noise = Noise(seed: frame.seed)
        
        let slices = Self.library.spiderSlices(.float(frame.seed), .float(maxTear * frame.envelope))
        let misprint = Self.library.spiderMisprint(
            .boundingRect,
            .float(frame.seed),
            .float(maxOffset * frame.envelope),
            .color(session?.ink.first ?? .clear),
            .color(session?.ink.second ?? .clear),
            .float(effects.contains(.misprint) ? 1 : 0),
            .float(effects.isDisjoint(with: [.misprint, .halftone]) ? 0 : 1),
            .float(effects.isDisjoint(with: [.misprint, .stripes]) ? 0 : 1),
            .float(effects.contains(.halftone) ? 1 : 0),
            .float(effects.contains(.stripes) ? 1 : 0)
        )
        
        return content
            .fontDesign(swapping ? noise.pick(Self.designs, 1) : nil)
            .fontWeight(swapping ? noise.pick(Self.weights, 2) : nil)
            .padding(padding)
            .distortionEffect(slices, maxSampleOffset: CGSize(width: maxTear, height: 0), isEnabled: moving && effects.contains(.slices))
            .layerEffect(misprint, maxSampleOffset: CGSize(width: maxOffset, height: maxOffset), isEnabled: ghosts)
            .padding(-padding)
    }
    
    fileprivate func portal(session: Session, frame: Frame, shown: Int, removed: Int) -> some View {
        GeometryReader { proxy in
            let side = max(proxy.size.width, proxy.size.height) * 1.15 + 60
            // The void stays dark enough for depth in dark mode, but only a tint in light mode so dark content stays legible.
            let void = colorScheme == .dark
            ? Color(red: 0.03, green: 0.02, blue: 0.06).opacity(0.75)
            : session.ink.second.opacity(0.18)
            Rectangle()
                .colorEffect(
                    Self.library.spiderPortal(
                        .boundingRect,
                        .float(frame.seed),
                        .float(frame.time),
                        .float(Float(shown)),
                        .float(Float(removed)),
                        .float(session.sides),
                        .float(session.twist),
                        .float2(session.drift.x, session.drift.y),
                        .color(session.ink.second),
                        .color(session.ink.first),
                        .color(void),
                        .float(2.5)
                    )
                )
                .frame(width: side, height: side)
                .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}

/// One portal layer arriving or leaving: `count` only ever grows, `layer` is its position from the rim.
fileprivate struct RingStep: Equatable {
    let count: Int
    let layer: Int
}

/// A tap for each portal layer, softer the deeper it sits.
fileprivate struct RingHaptics: ViewModifier {
    
    let step: RingStep
    
    func body(content: Content) -> some View {
        // visionOS only gained sensory feedback in 26.
        if #available(visionOS 26, *) {
            content.sensoryFeedback(trigger: step) { previous, current in
                guard current.count > previous.count else { return nil }
                return .impact(flexibility: .rigid, intensity: 1 - Double(current.layer) / 14)
            }
        } else {
            content
        }
    }
}

/// Repeatable randomness for one frame, so a held frame looks the same on every redraw.
fileprivate struct Noise {
    
    let seed: Float
    
    func unit(_ channel: Int) -> Double {
        var x = UInt64(Double(seed) * 1000) &+ UInt64(channel) &* 0x9E37_79B9_7F4A_7C15
        x = (x ^ (x >> 30)) &* 0xBF58_476D_1CE4_E5B9
        x = (x ^ (x >> 27)) &* 0x94D0_49BB_1331_11EB
        x ^= x >> 31
        return Double(x >> 11) / Double(1 << 53)
    }
    
    func signed(_ channel: Int) -> Double {
        unit(channel) * 2 - 1
    }
    
    func pick<T>(_ items: [T], _ channel: Int) -> T {
        items[min(Int(unit(channel) * Double(items.count)), items.count - 1)]
    }
}
// MARK: - Spiderversify API source (MIT; Copyright (c) 2023 Jaeho Yoo)
fileprivate extension View {
    
    /// Plays the Spider-Verse glitch each time `isActive` turns on, then turns it back off after `duration` seconds.
    fileprivate func spiderversify(
        _ isActive: Binding<Bool>,
        duration: TimeInterval = 1.5,
        style: SpiderverseStyle = .default
    ) -> some View {
        modifier(OneShotGlitch(isActive: isActive, duration: duration, style: style))
    }
    
    /// Glitches for as long as `isActive` is true.
    fileprivate func spiderversify(isActive: Bool, style: SpiderverseStyle = .default) -> some View {
        modifier(SpiderversifyEffect(isActive: isActive, activation: 0, style: style))
    }
    
    /// Plays the Spider-Verse glitch once each time `trigger` changes.
    fileprivate func spiderversify(
        trigger: some Equatable,
        duration: TimeInterval = 1.5,
        style: SpiderverseStyle = .default
    ) -> some View {
        modifier(TriggeredGlitch(trigger: trigger, duration: duration, style: style))
    }
    
    @available(*, deprecated, message: "Use spiderversify(_:duration:style:) and set SpiderverseStyle.framesPerSecond instead.")
    fileprivate func spiderversify(_ on: Binding<Bool>, duration: TimeInterval, glitchInterval: TimeInterval) -> some View {
        spiderversify(on, duration: duration, style: SpiderverseStyle(framesPerSecond: 1 / glitchInterval))
    }
}

fileprivate struct OneShotGlitch: ViewModifier {
    
    @Binding var isActive: Bool
    let duration: TimeInterval
    let style: SpiderverseStyle
    
    func body(content: Content) -> some View {
        content
            .modifier(SpiderversifyEffect(isActive: isActive, activation: 0, style: style))
            .task(id: isActive) {
                guard isActive else { return }
                try? await Task.sleep(for: .seconds(duration))
                if !Task.isCancelled {
                    isActive = false
                }
            }
    }
}

fileprivate struct TriggeredGlitch<Trigger: Equatable>: ViewModifier {
    
    let trigger: Trigger
    let duration: TimeInterval
    let style: SpiderverseStyle
    
    @State fileprivate var plays = 0
    @State fileprivate var isActive = false
    
    func body(content: Content) -> some View {
        content
            .modifier(SpiderversifyEffect(isActive: isActive, activation: plays, style: style))
            .onChange(of: trigger) {
                plays += 1
                isActive = true
            }
            .task(id: plays) {
                guard plays > 0 else { return }
                try? await Task.sleep(for: .seconds(duration))
                if !Task.isCancelled {
                    isActive = false
                }
            }
    }
}
