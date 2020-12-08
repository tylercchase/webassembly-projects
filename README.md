# An assortment of projects for the purposes of learning webassembly

Uses the [wabt](https://github.com/WebAssembly/wabt/tree/1.0.19) tools to compile webassembly

I have organized the code into different directories for different tasks/projects

The way I tested these projects out is by running 
```python
python3 -m http.server 8080
```

| Directory | Description |
| --- | --- |
| add | A basic add function in webassembly |
| accumulate | Adds numbers up to point in array by copying memory |
| cpp_test | Test out c++ to WASM via emscripten |
| go_sort | Use GO to sort a JS array |
