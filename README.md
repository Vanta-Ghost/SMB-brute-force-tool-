# SMB-brute-force-tool-
This is a basic SMB brute force tool created as part of my learning journey in ethical hacking and cybersecurity.

The tool attempts to brute force SMB shares on a target IP using a provided username and a password list.

⚠️ This tool is strictly for educational purposes and should only be used in controlled environments or on systems you own or have explicit permission to test. Unauthorized usage is illegal and unethical.

📂 Project Structure
.
├── bruteforce.bat       # Brute force batch script
└── passlist.txt         # Password list (example wordlist)

🚀 Features
Command-line based interface

Tests SMB logins using provided credentials

Automatically stops when the correct password is found

⚙️ Requirements
Windows OS

Basic command prompt usage

SMB must be enabled on the target machine

📖 How to Use
Clone this repository:
git clone https://github.com/yourusername/vanta-ghost-bruteforce.git
Prepare your password list as passlist.txt or specify another wordlist during runtime.
Run the script:
bruteforce.bat

Provide the required inputs when prompted:
IP Address: The target machine's IP
Username: SMB username
Password List: Path to your password list file

Enter IP Address: target_ip
Enter UserName: admin
Enter Pasword List: passlist.txt
The tool will attempt each password until success or the list ends.

⚡ Example Output
[Attempt 1] [123456]
[Attempt 2] [password]
[Attempt 3] [admin123]
Password Found!: admin123

⚠️ Warnings
For educational purposes only.
Do not use this tool against systems you do not own or without explicit permission.
Unauthorized attacks are illegal and can lead to severe penalties.
Use this tool in penetration testing labs, your own virtual machines, or with proper legal authorization.

📚 Disclaimer
I am not responsible for any misuse of this tool.
This project is solely intended for cybersecurity learning and responsible ethical hacking practices.


