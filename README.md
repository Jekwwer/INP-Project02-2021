# INP-Project02-2021

Solution for the 2nd project from the subject _'INP (Design of Computer Systems)'_ for the academic year 2021/22 at VUT FIT. \
Řešení 2. projektu z předmětu _'INP (Návrh počítačových systémů)'_ pro akademický rok 2021/22 na VUT FIT.

## Task: Vernam Cipher - Calculation on a Pipelined DLX Architecture

#### Project Objective:

- Understand basic principles and selected issues of pipelined instruction processing.

#### Assignment:

1. **Language & Tools:** Use the symbolic instruction language of the DLX processor architecture and the OpenDLX simulator.
2. **Task:** Implement a modified Vernam cipher algorithm.
3. **Cipher Details:**
   - Type: Substitution cipher.
   - Message: Lowercase English letters (a-z) and numbers (0-9).
   - Key: Two characters, English letters (a-z), applied cyclically to the message.
   - ASCII representation for encryption.

#### Example:

- **Message:** xbidlo01
- **Key:** bi
- **Result:** zskunf

#### Instructions:

1. **Setup:** Download and set up the OpenDLX simulator. Ensure Java is installed.
2. **Initial Testing:** Run the simulator and open the file `vernam.s`. Test its basic functioning.
3. **File Modification:** Modify `vernam.s` - update the header and replace the welcome message.
4. **Register Selection:** Use `registry.txt` to identify which registers to use based on your login.
5. **Coding:** After the "cipher" label, insert the Vernam cipher logic. Change the system call after the "end" label to display the encrypted message.
6. **Final Steps:** Rename the file to your login with a `.s` extension. Submit the renamed file to IS FIT.

#### Evaluation Details:

- **Non-functional solutions:** Graded 0 points.
- **Plagiarism:** Graded 0 points and possible disciplinary actions.

## Evaluation

- unecessarily many NOPpes
- inappropriate calculation modulo 2

Total points: **9/10**
