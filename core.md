# Terminology
| Word       | Meaning                                                                                |
|------------|----------------------------------------------------------------------------------------|
| Byte       | An 8-bit unit of space.                                                                |
| Word       | Two consecutive bytes interpreted as one 16-bit value.                                 |
| Doubleword | Two consecutive words interpreted as one 32-bit value.                                 |
| Quadword   | Two consecutive doublewords interpreted as one 64-bit value.                           |
| Octaword   | Two consecutive quadwords interpreted as one 128-bit value.                            |
| PC         | Program Counter register, points to the current instruction in the instruction stream. |

# Register file
SERAIS provides 32 64-bit integer registers, r0 through r31.
Alongside this, control registers PC, CR0, CR1, CR2, and CR3 are provided. CR0..CR3 are for OS and ABI specified usage, while PC provides a pointer to the currently executing instruction.
```
+-----------------------------------------------+
| R0                                            |
+-----------------------------------------------+
| R1                                            |

                       ...

| R30                                           |
+-----------------------------------------------+
| R31                                           |
+-----------------------------------------------+


+-----------------------------------------------+
| PC                                            |
+-----------------------------------------------+
| CR0                                           |
+-----------------------------------------------+
| CR1                                           |
+-----------------------------------------------+
| CR2                                           |
+-----------------------------------------------+
| CR3                                           |
+-----------------------------------------------+

```

# Instruction encoding
All SERAIS instructions match the following format:
```
 15 14 13 12 11 10 9  8  7  6  5  4  3  2  1  0
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                                            |0 |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+

 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                                            |1 |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+

 47 46 45 44 43 42 41 40 39 38 37 36 35 34 33 32
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                                            |1 |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+

 63 62 61 60 59 58 57 56 55 54 53 52 51 50 49 48
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                                            |1 |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+

```
Each instruction's LSB is a zero, and an instruction may be one to four words long, where each extension word must have it's LSB as a one. This encoding was chosen to make the middle of an instruction illegal, and to make an all zeros or all ones instruction trivially illegal. Some instructions may permit the absence of one or more words without changing the opcode, this is *only* the case for immediate extensions, where the decoder can trivially fill missing words with zeros or a sign extended value.
