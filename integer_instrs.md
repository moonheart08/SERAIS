## ADD
| Mnemonic | Opcode     | Func           | Encoding            | Description                                              |
|----------|------------|----------------|---------------------|----------------------------------------------------------|
| ADD.D    | `000 000`  | `000`<br>`001` | CA-Form<br>ICA-Form | Add two doubleword-size values, zero extending to 64-bit |
| ADD.Q    | `000 000`  | `010`<br>`011` | CA-Form<br>ICA-Form | Add two quadword-size values, zero extending to 64-bit   |
### Operation
```
DEST <- SRC1 + SRC2
```
## SUB
| Mnemonic | Opcode     | Func           | Encoding            | Description                                              |
|----------|------------|----------------|---------------------|----------------------------------------------------------|
| SUB.D    | `000 000`  | `100`<br>`101` | CA-Form<br>ICA-Form | Subtract two doubleword-size values, zero extending to 64-bit |
| SUB.Q    | `000 000`  | `110`<br>`111` | CA-Form<br>ICA-Form | Subtract two quadword-size values, zero extending to 64-bit   |
### Operation
```
DEST <- SRC1 - SRC2
```

## AND
| Mnemonic | Opcode     | Func           | Encoding            | Description                                              |
|----------|------------|----------------|---------------------|----------------------------------------------------------|
| AND.D    | `000 001`  | `000`<br>`001` | CA-Form<br>ICA-Form | Bitwise AND two doubleword-size values, zero extending to 64-bit |
| AND.Q    | `000 001`  | `010`<br>`011` | CA-Form<br>ICA-Form | Bitwise AND two quadword-size values, zero extending to 64-bit   |
### Operation
```
DEST <- SRC1 & SRC2
```

## OR
| Mnemonic | Opcode     | Func           | Encoding            | Description                                              |
|----------|------------|----------------|---------------------|----------------------------------------------------------|
| OR.D     | `000 001`  | `100`<br>`101` | CA-Form<br>ICA-Form | Bitwise OR two doubleword-size values, zero extending to 64-bit |
| OR.Q     | `000 001`  | `110`<br>`111` | CA-Form<br>ICA-Form | Bitwise OR two quadword-size values, zero extending to 64-bit   |
### Operation
```
DEST <- SRC1 | SRC2
```

## XOR
| Mnemonic | Opcode     | Func           | Encoding            | Description                                              |
|----------|------------|----------------|---------------------|----------------------------------------------------------|
| XOR.D    | `000 010`  | `000`<br>`001` | CA-Form<br>ICA-Form | Bitwise XOR two doubleword-size values, zero extending to 64-bit |
| XOR.Q    | `000 010`  | `010`<br>`011` | CA-Form<br>ICA-Form | Bitwise XOR two quadword-size values, zero extending to 64-bit   |
### Operation
```
DEST <- SRC1 ^ SRC2
```

## ANDN
| Mnemonic | Opcode     | Func           | Encoding            | Description                                              |
|----------|------------|----------------|---------------------|----------------------------------------------------------|
| ANDN.D   | `000 010`  | `100`<br>`101` | CA-Form<br>ICA-Form | Bitwise AND NOT two doubleword-size values, zero extending to 64-bit |
| ANDN.Q   | `000 010`  | `110`<br>`111` | CA-Form<br>ICA-Form | Bitwise AND NOT two quadword-size values, zero extending to 64-bit   |
### Operation
```
DEST <- SRC1 & ~SRC2
```
