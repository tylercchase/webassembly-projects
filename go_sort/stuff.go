package main

import "syscall/js"
import "sort"
func add(this js.Value, args []js.Value) interface{} {
	received := make([]byte, args[0].Get("length").Int())

    _ = js.CopyBytesToGo(received, args[0])
	sort.SliceStable(received, func(i, j int) bool {
		return received[i] < received[j]
	})
	dst := js.Global().Get("Uint8Array").New(len(received))
	js.CopyBytesToJS(dst, received)

	return dst
}
func registerCallbacks() {
	js.Global().Set("sort", js.FuncOf(add))
}

func main() {
    c := make(chan struct{}, 0)

    println("WASM Go Initialized")
    // register functions
    registerCallbacks()
    <-c
}