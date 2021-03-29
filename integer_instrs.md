## ADD
| Mnemonic | Opcode     | Func           | Encoding          | Description                                              |
|----------|------------|----------------|-------------------|----------------------------------------------------------|
| ADD.B    | `0000 000` | `000`<br>`001` | A-Form<br>AI-Form | Add two byte-size values, zero extending to 64-bit       |
| ADD.W    | `0000 000` | `010`<br>`011` | A-Form<br>AI-Form | Add two word-size values, zero extending to 64-bit       |
| ADD.D    | `0000 000` | `100`<br>`101` | A-Form<br>AI-Form | Add two doubleword-size values, zero extending to 64-bit |
| ADD.Q    | `0000 000` | `110`<br>`111` | A-Form<br>AI-Form | Add two quadword-size values, zero extending to 64-bit   |
### General behavior
```
OPSIZE result = src1 + src2;
return zero_extend(result, OPSIZE);
```

## SUB
| Mnemonic | Opcode     | Func           | Encoding          | Description                                                   |
|----------|------------|----------------|-------------------|---------------------------------------------------------------|
| SUB.B    | `0000 001` | `000`<br>`001` | A-Form<br>AI-Form | Subtract two byte-size values, zero extending to 64-bit       |
| SUB.W    | `0000 001` | `010`<br>`011` | A-Form<br>AI-Form | Subtract two word-size values, zero extending to 64-bit       |
| SUB.D    | `0000 001` | `100`<br>`101` | A-Form<br>AI-Form | Subtract two doubleword-size values, zero extending to 64-bit |
| SUB.Q    | `0000 001` | `110`<br>`111` | A-Form<br>AI-Form | Subtract two quadword-size values, zero extending to 64-bit   |
### General behavior
```
OPSIZE result = src1 - src2;
return zero_extend(result, OPSIZE);
```
