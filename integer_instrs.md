## ADD
| Mnemonic | Opcode     | Func           | Encoding          | Description                                              |
|----------|------------|----------------|-------------------|----------------------------------------------------------|
| ADD.B    | `0000 000` | `000`<br>`001` | A-Form<br>AI-Form | Add two byte-size values, zero extending to 64-bit       |
| ADD.W    | `0000 000` | `010`<br>`011` | A-Form<br>AI-Form | Add two word-size values, zero extending to 64-bit       |
| ADD.D    | `0000 000` | `100`<br>`101` | A-Form<br>AI-Form | Add two doubleword-size values, zero extending to 64-bit |
| ADD.Q    | `0000 000` | `110`<br>`111` | A-Form<br>AI-Form | Add two quadword-size values, zero extending to 64-bit   |
### Operation
```
DEST <- SRC1 + SRC2
```
### Flags
Sets flags according to the result.

## SUB
| Mnemonic | Opcode     | Func           | Encoding          | Description                                                   |
|----------|------------|----------------|-------------------|---------------------------------------------------------------|
| SUB.B    | `0000 001` | `000`<br>`001` | A-Form<br>AI-Form | Subtract two byte-size values, zero extending to 64-bit       |
| SUB.W    | `0000 001` | `010`<br>`011` | A-Form<br>AI-Form | Subtract two word-size values, zero extending to 64-bit       |
| SUB.D    | `0000 001` | `100`<br>`101` | A-Form<br>AI-Form | Subtract two doubleword-size values, zero extending to 64-bit |
| SUB.Q    | `0000 001` | `110`<br>`111` | A-Form<br>AI-Form | Subtract two quadword-size values, zero extending to 64-bit   |
### Operation
```
DEST <- SRC1 - SRC2
```
### Flags
Sets flags according to the result.

## AND
| Mnemonic | Opcode     | Func           | Encoding          | Description                |
|----------|------------|----------------|-------------------|----------------------------|
| AND      | `0000 010` | `000`<br>`001` | A-Form<br>AI-Form | Bitwise AND two quadwords. |
### Operation
```
DEST <- SRC1 & SRC2
```

### Flags
Sets flags according to the result.

## OR
| Mnemonic | Opcode     | Func           | Encoding          | Description                |
|----------|------------|----------------|-------------------|----------------------------|
| OR       | `0000 010` | `010`<br>`011` | A-Form<br>AI-Form | Bitwise OR two quadwords.  |
### Operation
```
DEST <- SRC1 | SRC2
```

### Flags
Sets flags according to the result.

## XOR
| Mnemonic | Opcode     | Func           | Encoding          | Description                |
|----------|------------|----------------|-------------------|----------------------------|
| XOR      | `0000 010` | `100`<br>`101` | A-Form<br>AI-Form | Bitwise XOR two quadwords. |
### Operation
```
DEST <- SRC1 ^ SRC2
```

### Flags
Sets flags according to the result.

## MOV
| Mnemonic | Opcode     | Func  | Encoding | Description          |
|----------|------------|-------|----------|----------------------|
| MOV      | `0000 010` | `110` | UA-Form  | Copies SRC1 to DEST. |
### Operation
```
DEST <- SRC1
```

### Flags
Doesn't set flags.

## NOP
| Mnemonic | Opcode     | Func  | Encoding | Description          |
|----------|------------|-------|----------|----------------------|
| NOP      | `0000 010` | `111` | UA-Form  | No operation.        |
### Operation
```
(Does nothing.)
```

### Flags
Doesn't set flags.


## ANDN
| Mnemonic | Opcode     | Func           | Encoding          | Description                    |
|----------|------------|----------------|-------------------|--------------------------------|
| ANDN     | `0000 011` | `000`<br>`001` | A-Form<br>AI-Form | Bitwise AND NOT two quadwords. |
### Operation
```
DEST <- SRC1 & ~SRC2
```

### Flags
Sets flags according to the result.

## ORN
| Mnemonic | Opcode     | Func           | Encoding          | Description                    |
|----------|------------|----------------|-------------------|--------------------------------|
| ORN      | `0000 011` | `010`<br>`011` | A-Form<br>AI-Form | Bitwise OR NOT two quadwords.  |
### Operation
```
DEST <- SRC1 | ~SRC2
```

### Flags
Sets flags according to the result.

## XNOR
| Mnemonic | Opcode     | Func           | Encoding          | Description                 |
|----------|------------|----------------|-------------------|-----------------------------|
| XNOR     | `0000 011` | `100`<br>`101` | A-Form<br>AI-Form | Bitwise XNOR two quadwords. |
### Operation
```
DEST <- ~(SRC1 ^ SRC2)
```

### Flags
Sets flags according to the result.

## NOT
| Mnemonic | Opcode     | Func           | Encoding            | Description             |
|----------|------------|----------------|---------------------|-------------------------|
| NOT      | `0000 011` | `110`<br>`111` | UA-Form<br>SUA-Form | Bitwise NOT a quadword. |
### Operation
```
DEST <- ~SRC1
```

### Flags
Sets flags according to the result.
