#include <metal_stdlib>
#include <SwiftUI/SwiftUI.h>
using namespace metal;

// MARK: - Helpers

static inline float hash(float n) {
  return fract(sin(n * 12.9898) * 43758.5453);
}

static inline float2 rotate(float2 p, float angle) {
  float c = cos(angle);
  float s = sin(angle);
  return float2(c * p.x - s * p.y, s * p.x + c * p.y);
}

// Ben-Day dots: a rotated grid of circles. `coverage` 0...1 grows the dots.
static inline float benDay(float2 p, float spacing, float coverage) {
  float2 cell = fract(rotate(p, 0.26) / spacing) - 0.5;
  float d = length(cell) * spacing;
  float r = spacing * 0.56 * sqrt(coverage);
  return 1.0 - smoothstep(r - 0.5, r + 0.5, d);
}

// Diagonal hatching, half ink and half paper.
static inline float hatch(float2 p, float spacing, float angle) {
  float f = abs(fract(rotate(p, angle).x / spacing) - 0.5);
  float aa = 0.5 / spacing;
  return 1.0 - smoothstep(0.25 - aa, 0.25 + aa, f);
}

// Signed distance to a regular polygon with a vertex at the top (negative inside).
static inline float ngon(float2 p, float sides, float circumradius) {
  float seg = 6.2831853 / sides;
  float a = atan2(p.y, p.x) + 1.5707963;
  float normal = seg * (floor(a / seg) + 0.5);
  return length(p) * cos(normal - a) - circumradius * cos(seg * 0.5);
}

static inline float line(float distance, float width) {
  return 1.0 - smoothstep(width * 0.5 - 0.5, width * 0.5 + 0.5, abs(distance));
}

// MARK: - Slices

// Tears horizontal bands sideways. Held for the whole frame, so it reads as a hard cut.
[[ stitchable ]] float2 spiderSlices(float2 position, float seed, float amount) {
  // Some frames stay clean, which makes the torn ones hit harder.
  if (hash(seed * 3.31) < 0.3) { return position; }

  float bandHeight = mix(3.0, 16.0, hash(seed * 1.77));
  float band = floor(position.y / bandHeight);
  if (hash(band * 13.1 + seed * 7.3) < 0.6) { return position; }

  float shift = (hash(band * 3.7 + seed * 1.3) * 2.0 - 1.0) * amount;
  return position + float2(shift, 0.0);
}

// MARK: - Misprint

// Draws two offset ink ghosts behind the content, like a comic page printed out of register.
// Ghost A can be filled with Ben-Day dots and ghost B with hatching; `split` also
// separates the content's own red and blue channels.
[[ stitchable ]] half4 spiderMisprint(float2 position, SwiftUI::Layer layer, float4 bounds,
                                      float seed, float amount,
                                      half4 inkA, half4 inkB,
                                      float split, float ghostA, float ghostB,
                                      float halftone, float stripes) {
  float burst = mix(0.35, 1.0, hash(seed * 3.17));
  float angle = hash(seed * 1.31 + 0.5) * 6.2831853;
  float2 offsetA = float2(cos(angle), sin(angle)) * amount * burst;
  float2 offsetB = rotate(-offsetA, (hash(seed * 5.71) - 0.5) * 1.2);

  half4 base = layer.sample(position);
  if (split > 0.5) {
    float2 s = offsetA * 0.4;
    half r = layer.sample(position - s).r;
    half b = layer.sample(position + s).b;
    base = half4(min(r, base.a), base.g, min(b, base.a), base.a);
  }

  float a = ghostA * float(layer.sample(position - offsetA).a);
  float b = ghostB * float(layer.sample(position - offsetB).a);

  if (halftone > 0.5) {
    // Dots grow along the diagonal, like comic shading.
    float2 uv = (position - bounds.xy) / max(bounds.zw, float2(1.0));
    a *= benDay(position, 5.0, mix(0.2, 0.95, uv.x * 0.6 + uv.y * 0.4));
  }
  if (stripes > 0.5) {
    b *= hatch(position, 4.0, 0.9);
  }

  half alphaA = half(a * 0.9);
  half alphaB = half(b * 0.9);
  half4 ghost = inkA * alphaA + inkB * alphaB * (1.0h - alphaA);
  return base + ghost * (1.0h - base.a);
}

// MARK: - Portal

// A tunnel of twisted rings receding behind a solid rim, flowing inward as if pulling the view in.
// `revealed` is how many rings have appeared so far; `removed` is how many layers have gone again,
// counting the rim as the first. The layer at the moving edge draws bolder for a beat.
[[ stitchable ]] half4 spiderPortal(float2 position, half4 color, float4 bounds,
                                    float seed, float time, float revealed, float removed,
                                    float sides, float twist, float2 drift,
                                    half4 fillInk, half4 lineInk, half4 voidInk, float lineWidth) {
  float2 p = position - (bounds.xy + bounds.zw * 0.5);
  float rimWidth = lineWidth * 2.5;
  float radius = min(bounds.z, bounds.w) * 0.5 - rimWidth;
  // The whole portal tilts a little on each glitch frame.
  p = rotate(p, (hash(seed * 2.17) - 0.5) * 0.08);

  float rim = ngon(p, sides, radius);
  float insideRim = 1.0 - smoothstep(-0.5, 0.5, rim + rimWidth * 0.5);
  float depth = 1.0 - clamp(length(p) / radius, 0.0, 1.0);
  bool opening = removed < 0.5;
  // Index of the layer at the edge: the newest while opening, the outermost left while closing.
  float edge = opening ? revealed - 1.0 : removed - 1.0;

  // Each ring sits one step deeper: smaller, twisted further and pulled toward a vanishing
  // point that is off-center so the tunnel bends away. `phase` slides them all inward.
  // The twist accelerates with depth, so the tunnel kinks harder the further in it goes.
  float phase = fract(time * 1.4);
  float rings = 0.0;
  // The floor only shows between the outermost and the deepest ring still there.
  float outer = rim;
  float outerWidth = rimWidth;
  float deepest = 1e5;
  bool any = false;
  for (int i = 0; i < 9; i++) {
    if (float(i) >= revealed) { break; }
    if (float(i) < removed - 1.0) { continue; }
    bool bold = float(i) == edge;
    float d = float(i) + phase;
    float s = pow(0.78, d);
    float2 q = rotate(p - drift * radius * (1.0 - s), -d * twist * (1.0 + 0.12 * d)) / s;
    float ring = ngon(q, sides, radius) * s;
    float width = max(lineWidth * (1.6 - d * 0.18), 1.0) * (bold ? 1.6 : 1.0);
    float fade = max((1.0 - d / 9.5) * smoothstep(0.0, 0.6, d), bold ? 1.0 : 0.0);
    rings = max(rings, line(ring, width) * fade);
    if (!any && !opening) {
      outer = ring;
      outerWidth = width;
    }
    deepest = ring;
    any = true;
  }
  rings *= insideRim;
  float rimInk = opening ? line(rim, rimWidth) : 0.0;
  float insideOuter = 1.0 - smoothstep(-0.5, 0.5, outer + outerWidth * 0.5);
  float hole = any ? 1.0 - smoothstep(-0.5, 0.5, deepest) : 1.0;
  float floor = insideOuter * (1.0 - hole);
  float dots = benDay(position, 6.0, 0.4) * floor * (1.0 - depth * 0.8) * 0.5;

  half4 result = voidInk * half(floor * (0.6 + 0.4 * depth));
  result = fillInk * half(dots) + result * (1.0h - half(dots));
  result = lineInk * half(rings) + result * (1.0h - half(rings));
  return lineInk * half(rimInk) + result * (1.0h - half(rimInk));
}
