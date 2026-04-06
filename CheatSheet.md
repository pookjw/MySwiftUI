```asm
cmp    x8, #0x0
eor    w8, w28, #0x1
csinc  w8, w8, wzr, ne
```

```swift
let w8 = (x8 != nil) ? !w28 : (0 + 1) // 0 -> wzr
```

---

```asm
tst    x21, #0x10
```

```swift
(x21 & 0x10) == 0
```

---

```asm
tst    w20, #0x1
mov    w8, #0x1
cinc   x2, x8, ne
```

```c
uint64_t x2 = 1 + ((w20 & 1) != 0);
```

---

```asm
bic    x22, x8, x24
```

```swift
x22 = x8 & ~x24
```

---

```asm
bics   wzr, w8, w27
b.eq   0x1d2d55a34
```

```swift
if ((w8 & ~w27) == 0) {
    goto 0x1d2d55a34
}
```

---

```asm
ubfx   x22, x24, #3, #4
```

```swift
x22 = (x24 >> 3) & 0b1111
```

---

```asm
mvn    w8, w25
mov    w9, #0x5
tst    x8, x9
b.ne   0x1d352663c
```

```c
if ((~w25 & 0x5) != 0) {
    goto 0x1d352663c;
}
```

---

```asm
cmp    x8, #0x0
ccmp   x20, x8, #0x0, ne
b.eq   0x1d207fcf8
```

```swift
if x8 != 0 && x20 == x8 {
    goto 0x1d207fcf8
}
```

---

```asm
extr   x0, x1, x0, #0x20
```

```swift
x0 = (x1 << 32) | (x0 >> 32)
```

---

```asm
fcmp   d2, d3
fccmp  d1, d4, #0x0, le
fccmp  d0, d5, #0x0, le
b.gt   0x1d36f97dc
```

```c
// expanded
if ((d2 > d3)
    || (!(d2 > d3) && (d1 > d4))
    || (!(d2 > d3) && !(d1 > d4) && (d0 > d5))) {
    goto 0x1d36f97dc;
}

// simplified (equivalent)
if ((d2 > d3) || (d1 > d4) || (d0 > d5)) {
    goto 0x1d36f97dc;
}
```

---

```asm
fcmp   d2, d3
fccmp  d1, d4, #0x8, pl
fccmp  d0, d5, #0x8, pl
b.pl   0x1d36f9854
```

```c
// NaN-aware
if (!(d2 < d3) && !(d1 < d4) && !(d0 < d5)) {
    goto 0x1d36f9854;
}

// simplified when NaN is ignored
if ((d2 >= d3) && (d1 >= d4) && (d0 >= d5)) {
    goto 0x1d36f9854;
}
```
