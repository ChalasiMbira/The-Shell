# Connect to Linux via SSH
$session = New-SSHSession -ComputerName "192.168.1.100" -Credential (Get-Credential)

# Create directories and files
Invoke-SSHCommand -SessionId $session.SessionId -Command "mkdir -p ~/linux-labs/lab1/{documents,backups}"
Invoke-SSHCommand -SessionId $session.SessionId -Command "touch ~/linux-labs/lab1/documents/file{1..5}.txt"
Invoke-SSHCommand -SessionId $session.SessionId -Command "ls -l ~/linux-labs/lab1/documents"

# Close SSH session
Remove-SSHSession -SessionId $session.SessionId