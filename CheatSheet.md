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
