# 🔢 Number System Converter

A feature-rich Number System Converter built using **HTML, CSS, JavaScript, and 8086 Assembly Language** as a Computer Organization and Architecture (COA) mini-project.

The project combines an interactive web-based interface with low-level number conversion implemented using 8086 assembly.

## ✨ Features

### Number System Conversion
- Binary to Decimal, Octal, and Hexadecimal
- Decimal to Binary, Octal, and Hexadecimal
- Octal to Binary, Decimal, and Hexadecimal
- Hexadecimal to Binary, Decimal, and Octal
- Input validation and error handling
- Copy conversion results instantly
- Recent conversion history

### Interactive Learning Tools
- Binary representation visualizer
- 1's and 2's complement calculator
- Binary addition and subtraction
- 8-bit binary visualizer
- Step-by-step conversion explanations

### 8086 Assembly Implementation
- Decimal-to-binary conversion
- Decimal-to-octal conversion
- Decimal-to-hexadecimal conversion
- Input validation
- 16-bit unsigned overflow detection
- Repeated division and remainder-based conversion

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| HTML5 | Web structure |
| CSS3 | Interface and styling |
| JavaScript | Conversion logic and interactive tools |
| 8086 Assembly | Low-level number conversion |
| EMU8086 | Assembly development and execution |
| Git & GitHub | Version control |

## 📁 Project Structure

```text
Number-system-converter/
│
├── index.html
├── style.css
├── script.js
├── README.md
│
├── assembly/
│   ├── number_converter_improved.asm
│   └── README.md
│
└── documentation/
    └── test-cases.md
```

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Midoriya-w/Number-system-converter.git
```

### 2. Open the project

```bash
cd Number-system-converter
```

### 3. Run the web application

Open `index.html` directly in your browser or use the Live Server extension in Visual Studio Code.

No Node.js, backend, or database is required.

## ⚙️ Running the 8086 Assembly Program

1. Install and open EMU8086.
2. Open the assembly source file inside `assembly/`.
3. Compile the program.
4. Run it using the emulator.
5. Test the decimal-to-binary, octal, and hexadecimal conversions.

**Note:** The browser application and assembly program are separate implementations. The web interface does not execute the assembly source.

## 🧪 Testing

The project includes test cases for:

- Standard decimal conversion
- Zero input
- Maximum 16-bit unsigned value (65535)
- Invalid characters
- Overflow input
- Binary arithmetic operations
- Complement calculations

See [`documentation/test-cases.md`](documentation/test-cases.md).

## 🎓 Academic Context

**Subject:** Computer Organization and Architecture (COA)  
**Project:** Number System Converter  
**Implementation:** Web Technologies + 8086 Assembly Language

The project demonstrates number representation, positional number systems, binary arithmetic, complements, registers, and low-level conversion algorithms.

## 👨‍💻 Author

**Dinesh**  
B.Tech CSE – Distributed & Cloud Computing  
SRM University – AP

GitHub: [@Midoriya-w](https://github.com/Midoriya-w)

---

⭐ If you find this project useful, consider giving it a star!
