# **INP-Project02-2021**:

### Vernam Cipher on Pipelined DLX Architecture

> **University**: [VUT FIT](https://www.fit.vut.cz/)
>
> **Course**: [INP (Design of Computer Systems)](https://www.fit.vut.cz/study/course/268250/)
>
> **Academic Year**: 2021/22

---

## 🎯 **Project Objective**

- Comprehend the fundamental principles and nuanced facets of pipelined instruction processing.

---

## 📋 **Assignment Details**

**Language & Tools**:

- Utilize the symbolic instruction language tailored for the DLX processor architecture.
- Employ the OpenDLX simulator for the task.

**Main Task**:

- Develop an algorithm for the modified Vernam cipher.

**Cipher Specifications**:

- **Type**: Substitution cipher.
- **Message**: Limited to lowercase English alphabets (a-z) and numerals (0-9).
- **Key**: A pair of English alphabets (a-z) applied cyclically over the message for encryption.
- Encryption relies on ASCII representation.

---

## 📜 **Example**

```
- Message: xbidlo01
- Key:     bi
- Result:  zskunf
```

---

## 🛠 **Instructions**

1. **Setup**: First, ensure Java's presence. Then, proceed with downloading and installing the OpenDLX simulator.
2. **Initiation Test**: Launch the simulator and load the `vernam.s` file. This step ensures basic operability.
3. **File Tweaking**: In `vernam.s`, refresh the header and supersede the initial welcome text.
4. **Register Assignment**: Refer to `registry.txt` to discern which registers are suitable, based on your personal login.
5. **Coding**: Post the "cipher" label, infuse the Vernam cipher logic. Subsequent to the "end" label, modify the system call to showcase the encrypted output.
6. **Completion**: Rename your file to reflect your login and append a `.s` extension. This renamed file should be uploaded to IS FIT.

---

## ⚠️ **Evaluation Specifics**

- **Non-operational Solutions**: These fetch 0 points.
- **Plagiarism**: Punishable with 0 points, coupled with potential disciplinary consequences.

---

## 📊 **Evaluation Results**

| Note                            | Status                  |            |
| ------------------------------- | ----------------------- | ---------: |
| Superfluous NOPs                | _Fixed post-evaluation_ |            |
| Misguided modulo 2 computations | _Fixed post-evaluation_ |            |
|                                 |                         |            |
| **Total Points:**               |                         |   **9/10** |
|                                 |                         | 🟢🟢🟢🟢🟡 |
