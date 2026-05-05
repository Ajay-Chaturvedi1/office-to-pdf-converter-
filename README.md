📄 Convert to PDF — Bash Script
A simple yet powerful bash script that batch converts multiple file formats to PDF using LibreOffice headless mode on Ubuntu.

📌 Features

Converts multiple file types to PDF in one command
Supports .doc, .docx, .xls, .xlsx, .ppt, .pptx, .png, .jpg, and more
Automatically creates an OUTPUT/ directory to store all converted PDFs
Handles multiple files at once using wildcard (*) or individual file paths
Clear success/failure logs for each file


🖥️ Requirements

OS: Ubuntu 24.04 LTS (or any Debian-based Linux)
Tool: LibreOffice (version 24.2+)

Install LibreOffice
bashsudo apt update
sudo apt install -y libreoffice
Verify installation:
bashlibreoffice --version

🚀 Usage
1. Clone the repository
bashgit clone https://github.com/YOUR_USERNAME/convert-to-pdf.git
cd convert-to-pdf
2. Make the script executable
bashchmod +x convert_to_pdf.sh
3. Run the script
Convert specific files:
bash./convert_to_pdf.sh file1.doc file2.ppt file3.xls
Convert all files in a folder:
bash./convert_to_pdf.sh ./your_folder/*

📂 Output
All converted PDF files are automatically saved inside the ./OUTPUT/ directory.
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

🧾 Script — convert_to_pdf.sh
bash#!/bin/bash

# Check if arguments are provided
if [ $# -eq 0 ]; then
        echo "Usage: $0 <file1> [file2...]"
        exit 1
fi

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

✅ Supported File Formats
FormatType.doc, .docxWord Document.xls, .xlsxExcel Spreadsheet.ppt, .pptxPowerPoint Presentation.png, .jpg, .jpegImages.odt, .ods, .odpLibreOffice formats.csvComma-Separated Values.txt, .rtfText / Rich Text

⚠️ Common Error & Fix
Error:
command not found: libraoffice
Fix: The correct command is libreoffice (not libraoffice). Install it using:
bashsudo apt install -y libreoffice

📜 License
This project is open-source and free to use under the MIT License.

🙋‍♂️ Author
Made with 💻 on Ubuntu 24.04 LTS (AWS EC2)
