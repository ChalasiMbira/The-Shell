# Define variables
$UserName = "newuser"
$Password = "SecurePassword123" | ConvertTo-SecureString -AsPlainText -Force
$HomeDir = "/home/$UserName"
$GroupName = "developers"

# Check if user exists
if (-not (Get-LocalUser -Name $UserName -ErrorAction SilentlyContinue)) {
    # Create the user
    sudo useradd -m -d $HomeDir -s /bin/bash $UserName
    Write-Output "User $UserName created successfully."

    # Set password (Linux requires chpasswd or passwd command)
    echo "$UserName:$Password" | sudo chpasswd
    Write-Output "Password set for $UserName."

    # Create group if not exists
    if (-not (getent group $GroupName)) {
        sudo groupadd $GroupName
        Write-Output "Group $GroupName created."
    }

    # Add user to the group
    sudo usermod -aG $GroupName $UserName
    Write-Output "User $UserName added to group $GroupName."

    # Set permissions for the home directory
    sudo chmod 750 $HomeDir
    sudo chown $UserName:$GroupName $HomeDir
    Write-Output "Permissions set for $UserName's home directory."

} else {
    Write-Output "User $UserName already exists."
}
