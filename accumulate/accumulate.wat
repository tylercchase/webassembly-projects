; based off the mozilla tutorial for webassembly
(module
  (memory (import "js" "mem") 1) ;import js memory
  (func (export "accumulate") (param $ptr i32) (param $len i32) (result i32) ;export function accumulate to js
    (local $end i32) ; declare variables
    (local $sum i32)
    (local.set $end (i32.add (local.get $ptr) (i32.mul (local.get $len) (i32.const 4))))
    (block $break (loop $top
      (br_if $break (i32.eq (local.get $ptr) (local.get $end))) ;if counter is at the end break
      (local.set $sum (i32.add (local.get $sum) ; set sum equal to sum + current ptr
                               (i32.load (local.get $ptr)))) ;load up the number in the pointer onto stack
        (local.set $ptr (i32.add (local.get $ptr) (i32.const 4))) ; move the ptr by 4
        (br $top)
    ))
    (local.get $sum)
  )
)
