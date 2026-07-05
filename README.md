#  Convert to PDF — Bash Script

A simple yet powerful bash script that **batch converts multiple file formats to PDF** using LibreOffice headless mode on Ubuntu.

---

##  Features

- Converts multiple file types to PDF in one command
- Supports `.doc`, `.docx`, `.xls`, `.xlsx`, `.ppt`, `.pptx`, `.png`, `.jpg`, and more
- Automatically creates an `OUTPUT/` directory to store all converted PDFs
- Handles multiple files at once using wildcard (`*`) or individual file paths
- Clear success/failure logs for each file

---

##  Requirements

- **OS:** Ubuntu 24.04 LTS (or any Debian-based Linux)
- **Tool:** LibreOffice (version 24.2+)

### Install LibreOffice

```bash
sudo apt update
sudo apt install -y libreoffice
```

Verify installation:

```bash
libreoffice --version
```

---

##  Usage

### 1. Clone the repository

```bash
git clone https://github.com/Ajay-Chaturvedi1/convert-to-pdf.git
cd convert-to-pdf
```

### 2. Make the script executable

```bash
chmod +x convert_to_pdf.sh
```

### 3. Run the script

**Convert specific files:**
```bash
./convert_to_pdf.sh file1.doc file2.ppt file3.xls
```

**Convert all files in a folder:**
```bash
./convert_to_pdf.sh ./your_folder/*
```

---

##  Output

All converted PDF files are automatically saved inside the `./OUTPUT/` directory.

```
your_folder/
├── file-sample_100kB.doc
├── SamplePPTFile_500kb.ppt
├── file_example_XLS_10.xls
└── image.png

OUTPUT/
├── file-sample_100kB.pdf
├── SamplePPTFile_500kb.pdf
├── file_example_XLS_10.pdf
└── image.pdf
```

---

##  Script — `convert_to_pdf.sh`

```bash
#!/bin/bash

# Check if arguments are provided
if [ $# -eq 0 ]; then
        echo "Usage: $0 <file1> [file2...]"
        exit 1
else

# All converted files will be stored here
OUTPUT_DIR="./OUTPUT"
mkdir -p "$OUTPUT_DIR"

# Loop through each file and convert to PDF
for file in "$@"; do
        if [ ! -f "$file" ]; then
                echo "$file file not found"
                continue
        fi

        echo "Converting: $file"

        libreoffice --headless --convert-to pdf "$file" --outdir "$OUTPUT_DIR"

        if [ $? -eq 0 ]; then
                echo "$file successfully converted into pdf."
        else
                echo "failed to convert $file into pdf"
        fi
done

echo "All convertions are completed successfully and stored in $OUTPUT_DIR"
fi
```

---

##  Supported File Formats

| Format | Type |
|--------|------|
| `.doc`, `.docx` | Word Document |
| `.xls`, `.xlsx` | Excel Spreadsheet |
| `.ppt`, `.pptx` | PowerPoint Presentation |
| `.png`, `.jpg`, `.jpeg` | Images |
| `.odt`, `.ods`, `.odp` | LibreOffice formats |
| `.csv` | Comma-Separated Values |
| `.txt`, `.rtf` | Text / Rich Text |

---

##  Common Error & Fix

**Error:**
```
command not found: libraoffice
```

**Fix:** The correct command is `libreoffice` (not `libraoffice`). Install it using:
```bash
sudo apt install -y libreoffice
```

---

##  License

This project is open-source and free to use.

---

##  Author

Ajay Chaturvedi

---
## extra but important information
- For Windows UsersYou must use the Numeric Keypad (the block of numbers on the right side of your keyboard). 
- Hold the Alt key and type the following numbers:
- To get │ (Vertical line): Hold Alt + type 179
- To get ├ (Branch): Hold Alt + type 195
- To get ─ (Horizontal line): Hold Alt + type 196
- To get └ (Corner): Hold Alt + type 192
- Standard Line Characters
  - Horizontal line (─): Alt + 196
  - Vertical line (│): Alt + 179
- Corner Characters
  - Top-left corner (┌): Alt + 218
  - Top-right corner (┐): Alt + 191
  - Bottom-left corner (└): Alt + 192
  - Bottom-right corner (┘): Alt + 217
- Basic Directional Arrows
  - Left arrow (←): Alt + 27
  - Right arrow (→): Alt + 26
  - Up arrow (↑): Alt + 24
  - Down arrow (↓): Alt + 25
- Double and Special Arrows
  - Up and Down arrow (↕): Alt + 18
  - Left and Right arrow (↔): Alt + 29
  - Right double arrow (►): Alt + 16
  - Left double arrow (◄): Alt + 17

