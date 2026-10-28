import UIKit
import SwiftUI

fileprivate struct MyView: View {
    @Environment(\.scenePhase) private var scenePhase
    @State private var startDate = Date()

    var body: some View {
        TimelineView(.animation(minimumInterval: 1.0 / 60.0,
                                paused: scenePhase != .active)) { timeline in
            let time = timeline.date.timeIntervalSince(startDate)
            Canvas { context, size in
                let scale = min(size.width / 800, size.height / 1000)
                context.translateBy(x: (size.width - 800 * scale) / 2,
                                    y: (size.height - 1000 * scale) / 2)
                context.scaleBy(x: scale, y: scale)
                context.clip(to: Path(CGRect(x: 0, y: 0, width: 800, height: 1000)))
                Garden.draw(in: &context, time: CGFloat(time))
                var glow = context
                        glow.opacity = 0.8
                        glow.blendMode = .screen
                        glow.addFilter(.shadow(color: .yellow.opacity(0.8), radius: 12, x: 0, y: 0))
                        glow.addFilter(.blur(radius: 2))
                        glow.drawLayer { layer in
                            layer.fill(Path(ellipseIn: CGRect(x: 520, y: 200, width: 90, height: 90)),
                                       with: .conicGradient(Gradient(colors: [.yellow, .orange, .pink, .yellow]),
                                                            center: CGPoint(x: 565, y: 245)))
                        }

                        var mask = context
                        mask.clipToLayer { layer in
                            layer.fill(Path(ellipseIn: CGRect(x: 50, y: 90, width: 170, height: 80)), with: .color(.white))
                        }
                        mask.fill(Path(CGRect(x: 40, y: 80, width: 190, height: 100)),
                                  with: .linearGradient(Gradient(colors: [.pink, .yellow]),
                                                        startPoint: CGPoint(x: 40, y: 80),
                                                        endPoint: CGPoint(x: 230, y: 180)))

                        var badge = context
                        badge.concatenate(CGAffineTransform(translationX: 0, y: 0))
                        let bounds = badge.clipBoundingRect
                        let currentTransform = badge.transform
                        let environment = badge.environment
                        _ = (bounds, currentTransform, environment)

                        var shadow = context
                        shadow.addFilter(.brightness(0.1))
                        shadow.addFilter(.saturation(1.2))
                        shadow.addFilter(.contrast(1.1))
                        shadow.fill(Path(ellipseIn: CGRect(x: 650, y: 360, width: 45, height: 45)),
                                    with: .color(.pink))
                context.withCGContext { cgContext in
                    cgContext.saveGState()
                    cgContext.setStrokeColor(UIColor.white.withAlphaComponent(0.65).cgColor)
                    cgContext.setLineWidth(2)
                    for index in 0..<7 {
                        let x = CGFloat(490 + index * 40)
                        let y = CGFloat(490 - index % 3 * 30)
                        cgContext.move(to: CGPoint(x: x - 8, y: y))
                        cgContext.addLine(to: CGPoint(x: x + 8, y: y))
                        cgContext.move(to: CGPoint(x: x, y: y - 8))
                        cgContext.addLine(to: CGPoint(x: x, y: y + 8))
                    }
                    cgContext.strokePath()
                    cgContext.restoreGState()
                }
                if let circle = context.resolveSymbol(id: "circle") {
                    context.draw(circle, at: CGPoint(x: 745, y: 930))
                    let symbolSize = circle.size
                    var circleEffects = context
                    circleEffects.blendMode = .multiply
                    circleEffects.addFilter(.hueRotation(.degrees(90)))
                    circleEffects.addFilter(.grayscale(0.3))
                    circleEffects.draw(circle, in: CGRect(x: 80, y: 820, width: symbolSize.width * 1.5, height: symbolSize.height * 1.5))

                    var cutout = context
                    cutout.clip(to: Path(ellipseIn: CGRect(x: 180, y: 820, width: 60, height: 60)), options: .inverse)
                    cutout.fill(Path(ellipseIn: CGRect(x: 165, y: 805, width: 90, height: 90)),
                                with: .conicGradient(Gradient(colors: [.red, .yellow, .red]),
                                                     center: CGPoint(x: 210, y: 850), options: [.mirror]))
                }
            } symbols: {
                Circle()
                    .foregroundStyle(Color.red)
                    .frame(width: 48, height: 48)
                    .tag("circle")
            }
        }
        .background(Color(red: 0.76, green: 0.88, blue: 0.91))
    }
}

fileprivate enum Garden {
    static func wrap(_ value: CGFloat, span: CGFloat) -> CGFloat {
        value - floor(value / span) * span
    }

    static func wind(_ time: CGFloat, x: CGFloat) -> CGFloat {
        sin(time * 1.7 - x * 0.008) * 0.65
            + sin(time * 0.63 - x * 0.003) * 0.5
            + sin(time * 3.1 + x * 0.014) * 0.15
    }

    static func airborne(in context: inout GraphicsContext, time: CGFloat) {
        var sunlight = context
        sunlight.blendMode = .plusLighter
        for i in 0..<6 {
            let offset = CGFloat(i) * 100 + sin(time * 0.45 + CGFloat(i)) * 65
            var ray = Path()
            ray.move(to: CGPoint(x: 650, y: 155))
            ray.addLine(to: CGPoint(x: offset - 200, y: 1000))
            ray.addLine(to: CGPoint(x: offset - 100, y: 1000))
            ray.closeSubpath()
            sunlight.fill(ray, with: .linearGradient(
                Gradient(colors: [color(0xFFF3B0).opacity(0.09), .clear]),
                startPoint: CGPoint(x: 650, y: 155), endPoint: CGPoint(x: offset, y: 1000)))
        }
        for i in 0..<75 {
            let seed = noise(i, 70)
            let speed = 35 + noise(i, 71) * 70
            let x = wrap(seed * 1100 + time * speed, span: 1100) - 150
            let y = wrap(noise(i, 72) * 1100 + time * (12 + seed * 28), span: 1100) - 80
                + sin(time * 2 + CGFloat(i)) * 28
            var particle = context
            particle.translateBy(x: x, y: y)
            particle.rotate(by: .radians(Double(time * (1 + seed * 3) + CGFloat(i))))
            if i % 3 == 0 {
                let flutter = 0.25 + abs(sin(time * 5 + CGFloat(i))) * 0.75
                particle.scaleBy(x: flutter, y: 1)
                var petal = Path()
                petal.move(to: CGPoint(x: -9, y: 0))
                petal.addCurve(to: CGPoint(x: 10, y: 0), control1: CGPoint(x: -4, y: -13),
                               control2: CGPoint(x: 12, y: -10))
                petal.addQuadCurve(to: CGPoint(x: -9, y: 0), control: CGPoint(x: 0, y: 9))
                particle.fill(petal, with: .color(color(i % 2 == 0 ? 0xF78CA4 : 0xCDE08B).opacity(0.85)))
            } else {
                let radius = 1.5 + seed * 2.5
                particle.fill(Path(ellipseIn: CGRect(x: -radius, y: -radius, width: radius * 2, height: radius * 2)),
                              with: .color(color(0xFFF4B5).opacity(Double(0.35 + 0.4 * abs(sin(time * 2 + CGFloat(i)))))))
            }
        }
        for i in 0..<9 {
            let phase = CGFloat(i) * 2.399
            let x = 400 + sin(time * (0.35 + noise(i, 81) * 0.25) + phase) * 300
            let y = 480 + cos(time * 0.63 + phase) * 180 + sin(time * 1.9 + phase) * 45
            var butterfly = context
            butterfly.translateBy(x: x, y: y)
            butterfly.rotate(by: .radians(Double(sin(time * 0.8 + phase) * 0.6)))
            let flap = 0.15 + abs(sin(time * 15 + phase)) * 0.85
            let tint = color([UInt32(0xFFD46B), 0xA6DFFF, 0xF5A4D0][i % 3])
            for side: CGFloat in [-1, 1] {
                var wing = butterfly
                wing.scaleBy(x: side * flap, y: 1)
                let upper = Path(ellipseIn: CGRect(x: 0, y: -15, width: 20, height: 21))
                let lower = Path(ellipseIn: CGRect(x: 1, y: 1, width: 14, height: 15))
                wing.fill(upper, with: .color(tint))
                wing.fill(lower, with: .color(tint.opacity(0.8)))
                wing.stroke(upper, with: .color(color(0x49304D)), lineWidth: 1.5)
                wing.stroke(lower, with: .color(color(0x49304D)), lineWidth: 1)
                wing.fill(Path(ellipseIn: CGRect(x: 10, y: -9, width: 4, height: 5)), with: .color(.white.opacity(0.85)))
            }
            line([CGPoint(x: 0, y: -10), CGPoint(x: 0, y: 12)], in: &butterfly, color: color(0x362B40), width: 2.5)
            for side: CGFloat in [-1, 1] {
                line([CGPoint(x: 0, y: -8), CGPoint(x: side * 5, y: -16)],
                     in: &butterfly, color: color(0x362B40), width: 1)
            }
        }
    }

    static func color(_ hex: UInt32) -> Color {
        Color(red: Double((hex >> 16) & 255) / 255,
              green: Double((hex >> 8) & 255) / 255,
              blue: Double(hex & 255) / 255)
    }
    
    static func noise(_ index: Int, _ salt: Int = 0) -> CGFloat {
        let value = sin(Double(index) * 127.1 + Double(salt) * 311.7) * 43758.5453
        return CGFloat(value - floor(value))
    }
    
    static func line(_ points: [CGPoint], in context: inout GraphicsContext,
                     color: Color, width: CGFloat) {
        guard let first = points.first else { return }
        var path = Path()
        path.move(to: first)
        for point in points.dropFirst() { path.addLine(to: point) }
        context.stroke(path, with: .color(color),
                       style: StrokeStyle(lineWidth: width, lineCap: .round, lineJoin: .round))
    }
    
    static func draw(in context: inout GraphicsContext, time: CGFloat) {
        context.fill(Path(CGRect(x: 0, y: 0, width: 800, height: 1000)), with: .linearGradient(
            Gradient(colors: [color(0x78BCE0), color(0xE6F3D9)]),
            startPoint: .zero, endPoint: CGPoint(x: 0, y: 720)))
        
        context.fill(Path(ellipseIn: CGRect(x: 540, y: 50, width: 220, height: 220)),
                     with: .radialGradient(Gradient(colors: [color(0xFFF5C4), color(0xFFF5C4).opacity(0)]),
                                           center: CGPoint(x: 650, y: 160), startRadius: 35, endRadius: 110))
        context.fill(Path(ellipseIn: CGRect(x: 615, y: 125, width: 70, height: 70)), with: .color(color(0xFFF8D9)))
        for i in 0..<13 {
            let x = wrap(noise(i, 1) * 1100 + time * (9 + noise(i, 4) * 12), span: 1100) - 220
            let y = 70 + noise(i, 2) * 260
            context.fill(Path(ellipseIn: CGRect(x: x, y: y, width: 90 + noise(i, 3) * 90, height: 24)),
                         with: .color(.white.opacity(0.18)))
        }
        
        for (y, shade) in [(CGFloat(580), UInt32(0x83AF70)), (640, 0x639A58), (710, 0x397C45)] {
            var hill = Path()
            hill.move(to: CGPoint(x: 0, y: y))
            hill.addCurve(to: CGPoint(x: 800, y: y + 20), control1: CGPoint(x: 270, y: y - 120),
                          control2: CGPoint(x: 520, y: y + 90))
            hill.addLine(to: CGPoint(x: 800, y: 1000))
            hill.addLine(to: CGPoint(x: 0, y: 1000))
            hill.closeSubpath()
            context.fill(hill, with: .linearGradient(Gradient(colors: [color(shade), color(0x244D35)]),
                                                     startPoint: CGPoint(x: 0, y: y), endPoint: CGPoint(x: 0, y: 1100)))
        }
        context.fill(Path(ellipseIn: CGRect(x: 75, y: 716, width: 410, height: 65)),
                     with: .radialGradient(Gradient(colors: [.black.opacity(0.25), .clear]),
                                           center: CGPoint(x: 280, y: 748), startRadius: 5, endRadius: 220))
        var treeContext = context
        treeContext.translateBy(x: 260, y: 755)
        treeContext.rotate(by: .radians(Double(wind(time, x: 260) * 0.035)))
        treeContext.translateBy(x: -260, y: -755)
        tree(in: &treeContext, time: time)
        grass(in: &context, count: 1200, minY: 640, maxY: 1000, time: time)
        
        for i in 0..<17 {
            let x = 390 + noise(i, 11) * 350
            let baseY = 875 + noise(i, 12) * 105
            let height = 100 + noise(i, 13) * 180
            var roseContext = context
            roseContext.translateBy(x: x, y: baseY)
            roseContext.rotate(by: .radians(Double(wind(time, x: x) * 0.12 + sin(time * 3 + CGFloat(i)) * 0.025)))
            roseContext.translateBy(x: -x, y: -baseY)
            rose(in: &roseContext, x: x, baseY: baseY, height: height, index: i, time: time)
        }
        grass(in: &context, count: 280, minY: 947, maxY: 1000, time: time)
        airborne(in: &context, time: time)
    }
    
    static func tree(in context: inout GraphicsContext, time: CGFloat) {
        var trunk = Path()
        trunk.move(to: CGPoint(x: 215, y: 755))
        trunk.addCurve(to: CGPoint(x: 249, y: 414), control1: CGPoint(x: 262, y: 672), control2: CGPoint(x: 218, y: 530))
        trunk.addLine(to: CGPoint(x: 279, y: 405))
        trunk.addCurve(to: CGPoint(x: 301, y: 755), control1: CGPoint(x: 271, y: 540), control2: CGPoint(x: 263, y: 684))
        trunk.addQuadCurve(to: CGPoint(x: 215, y: 755), control: CGPoint(x: 263, y: 738))
        context.fill(trunk, with: .linearGradient(Gradient(colors: [color(0x49382C), color(0x9B754B), color(0x4B392B)]),
                                                  startPoint: CGPoint(x: 225, y: 0), endPoint: CGPoint(x: 292, y: 0)))
        for i in 0..<12 {
            let x = 236 + noise(i, 21) * 42
            line([CGPoint(x: x, y: 735), CGPoint(x: x - 7, y: 640), CGPoint(x: x + 3, y: 540)],
                 in: &context, color: color(0x352E25).opacity(0.35), width: 1 + noise(i) * 2)
        }
        for i in 0..<9 {
            let angle = CGFloat(i) * 0.36 + 3.3
            line([CGPoint(x: 260, y: 575), CGPoint(x: 260 + cos(angle) * 65, y: 450 + sin(angle) * 60),
                  CGPoint(x: 260 + cos(angle) * 170, y: 365 + sin(angle) * 100)],
                 in: &context, color: color(0x66503A), width: 16 - CGFloat(i))
        }
        let shades: [UInt32] = [0x244D37, 0x326644, 0x40804A, 0x58964F, 0x79AB59]
        for i in 0..<420 {
            let angle = noise(i, 31) * .pi * 2
            let radius = sqrt(noise(i, 32))
            let x = 260 + cos(angle) * radius * 205 + sin(time * 2.4 + radius * 8) * 7 * radius
            let y = 345 + sin(angle) * radius * 180 + cos(time * 2 + angle * 3) * 5 * radius
            let diameter = 24 + noise(i, 33) * 62
            let light = max(0, min(4, Int((1 - (y - 165) / 360) * 4 + noise(i, 34) * 1.5)))
            context.fill(Path(ellipseIn: CGRect(x: x - diameter / 2, y: y - diameter / 2,
                                                width: diameter, height: diameter * 0.8)),
                         with: .color(color(shades[light])))
        }
        for i in 0..<650 {
            let angle = noise(i, 35) * .pi * 2
            let radius = sqrt(noise(i, 36))
            let x = 260 + cos(angle) * radius * 195 + sin(time * 2.4 + radius * 8) * 7 * radius
            let y = 335 + sin(angle) * radius * 165 + cos(time * 2 + angle * 3) * 5 * radius
            context.fill(Path(ellipseIn: CGRect(x: x, y: y, width: 3 + noise(i) * 8, height: 3)),
                         with: .color(color(0xB7D776).opacity(0.18 + noise(i, 37) * 0.3)))
        }
    }
    
    static func grass(in context: inout GraphicsContext, count: Int, minY: CGFloat, maxY: CGFloat, time: CGFloat) {
        let shades: [UInt32] = [0x75A84C, 0xA4C665, 0x386B3A, 0x568D42, 0xC1D67A]
        for i in 0..<count {
            let x = noise(i, Int(minY)) * 800
            let y = minY + noise(i, 42) * (maxY - minY)
            let depth = (y - 580) / 420
            let height = (7 + noise(i, 43) * 27) * depth
            let sway = wind(time, x: x + y * 0.3) * height * 0.75
                + sin(time * 5 + CGFloat(i)) * height * 0.15
            var blade = Path()
            blade.move(to: CGPoint(x: x, y: y))
            blade.addQuadCurve(to: CGPoint(x: x + sway + (noise(i, 44) - 0.5) * 24, y: y - height),
                               control: CGPoint(x: x + sway * 0.4 + 3, y: y - height * 0.65))
            context.stroke(blade, with: .color(color(shades[i % shades.count]).opacity(0.8)),
                           style: StrokeStyle(lineWidth: max(0.6, depth * 1.8), lineCap: .round))
        }
    }
    
    static func leaf(in context: inout GraphicsContext, origin: CGPoint, angle: CGFloat, length: CGFloat) {
        var local = context
        local.translateBy(x: origin.x, y: origin.y)
        local.rotate(by: .radians(Double(angle)))
        var shape = Path()
        shape.move(to: .zero)
        shape.addQuadCurve(to: CGPoint(x: length, y: 0), control: CGPoint(x: length * 0.45, y: -length * 0.5))
        shape.addQuadCurve(to: .zero, control: CGPoint(x: length * 0.55, y: length * 0.35))
        local.fill(shape, with: .linearGradient(Gradient(colors: [color(0x245836), color(0x6FA455)]),
                                                startPoint: .zero, endPoint: CGPoint(x: 0, y: -length * 0.4)))
        line([.zero, CGPoint(x: length * 0.9, y: 0)], in: &local, color: color(0xACCA78).opacity(0.65), width: 0.8)
        for i in 1..<5 {
            let x = length * CGFloat(i) / 6
            for side: CGFloat in [-1, 1] {
                line([CGPoint(x: x, y: 0), CGPoint(x: x + length * 0.14, y: side * length * 0.17)],
                     in: &local, color: color(0xA4C878).opacity(0.4), width: 0.5)
            }
        }
    }
    
    static func rose(in context: inout GraphicsContext, x: CGFloat, baseY: CGFloat, height: CGFloat, index: Int, time: CGFloat) {
        let topY = baseY - height
        let bend = (noise(index, 51) - 0.5) * 35
        var stem = Path()
        stem.move(to: CGPoint(x: x, y: baseY))
        stem.addCurve(to: CGPoint(x: x + bend, y: topY), control1: CGPoint(x: x - 12, y: baseY - height * 0.4),
                      control2: CGPoint(x: x + bend + 10, y: topY + height * 0.25))
        context.stroke(stem, with: .color(color(0x214C32)), style: StrokeStyle(lineWidth: 4, lineCap: .round))
        for j in 0..<4 {
            let y = baseY - height * (0.2 + CGFloat(j) * 0.17)
            let side: CGFloat = j % 2 == 0 ? -1 : 1
            leaf(in: &context, origin: CGPoint(x: x + bend * 0.5, y: y),
                 angle: side < 0 ? -.pi + 0.5 : -0.5, length: 28 + noise(index + j, 52) * 18)
            line([CGPoint(x: x, y: y + 10), CGPoint(x: x - side * 6, y: y + 5)],
                 in: &context, color: color(0x80965B), width: 1.5)
        }
        var flower = context
        flower.translateBy(x: x + bend, y: topY)
        flower.rotate(by: .radians(Double(sin(time * 2.7 + CGFloat(index)) * 0.13)))
        let bloom = 1 + sin(time * 1.8 + CGFloat(index)) * 0.06
        flower.scaleBy(x: bloom, y: bloom)
        let radius = 18 + noise(index, 53) * 13
        for j in 0..<5 {
            leaf(in: &flower, origin: .zero, angle: CGFloat(j) * .pi * 2 / 5,
                 length: radius * 1.15)
        }
        let pink = index % 3 == 0
        let palette: [UInt32] = pink
        ? [0x8D2851, 0xBD4775, 0xE9799C, 0xFFB1BF]
        : [0x640E2D, 0xA51D42, 0xD83E58, 0xF77980]
        for layer in 0..<4 {
            let count = 9 - layer
            let r = radius * (1 - CGFloat(layer) * 0.22)
            for j in 0..<count {
                var petalContext = flower
                petalContext.rotate(by: .radians(Double(j) * .pi * 2 / Double(count) + Double(layer) * 0.65))
                var petal = Path()
                petal.move(to: CGPoint(x: -r * 0.46, y: 0))
                petal.addCurve(to: CGPoint(x: r * 0.46, y: 0),
                               control1: CGPoint(x: -r * 1.2, y: -r * 1.35),
                               control2: CGPoint(x: r * 1.05, y: -r * 1.3))
                petal.addQuadCurve(to: CGPoint(x: -r * 0.46, y: 0), control: CGPoint(x: 0, y: r * 0.25))
                petalContext.fill(petal, with: .linearGradient(
                    Gradient(colors: [color(palette[min(3, layer + 1)]), color(palette[0])]),
                    startPoint: CGPoint(x: 0, y: -r), endPoint: CGPoint(x: 0, y: r * 0.3)))
                petalContext.stroke(petal, with: .color(color(palette[3]).opacity(0.45)), lineWidth: 0.65)
            }
        }
        flower.fill(Path(ellipseIn: CGRect(x: -2.5, y: -3, width: 5, height: 5)), with: .color(color(palette[0])))
        flower.fill(Path(ellipseIn: CGRect(x: radius * 0.4, y: -radius * 0.45, width: 3, height: 4)),
                    with: .color(.white.opacity(0.65)))
    }
}

final class TimelineViewController : UIViewController {
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
