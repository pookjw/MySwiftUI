#ifndef AGAttribute_h
#define AGAttribute_h

/*
uint32_t인 이유 (추정)
- swift-reflection-dump에서는 AGAttribute가 'yi'라고 뜸
- _C.AGWeakAttribute이 AGAttribute (identifier)와 yi (seed)를 가지고 있음. 다시 말해 같은 데이터 타입을 두 개 가지고 있다는 뜻
- $sSo15AGWeakAttributea0B5GraphE2eeoiySbAB_ABtFZ:        // static (extension in AttributeGraph):__C.AGWeakAttribute.== infix(__C.AGWeakAttribute, __C.AGWeakAttribute) -> Swift.Bool
을 보면 x0, x1을 통째로 읽어 와서 비교하고 있다. 따라서 똑같은 2개의 값 = 64비트 값이므로 하나는 32비트
- 통상적으로 seed는 unsigned일 것
*/
typedef uint32_t AGAttribute __attribute__((swift_wrapper(struct)));

#endif /* AGAttribute_h */