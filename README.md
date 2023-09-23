# ytstream: 24/7 YouTube Live Streaming with FFmpeg on a VPS

Welcome to `ytstream`! This repository is tailored for enthusiasts looking to achieve continuous live streaming on YouTube using a free VPS. Dive into the world of 24/7 streaming without any hassle.

🎥 **Catch our ongoing live demonstration**: [`Click Here`](https://www.youtube.com/watch?v=QC2bZbItW2E)
[![PixelMario Live Stream](https://github.com/ec-026/ytstream/assets/95495584/498de624-1187-48fd-b448-b79d355186f4)](https://www.youtube.com/watch?v=QC2bZbItW2E)

## Instructions for Setup and Use:

### 1. FFmpeg Installation on VPS

```bash
# Add FFmpeg repository
sudo add-apt-repository ppa:mc3man/trusty-media

# Update package list
sudo apt-get update

# Install FFmpeg
sudo apt-get install ffmpeg
```
To verify the installation:
```bash
ffmpeg -version
```

### 2. Uploading Media Files with FileZilla
Download and install FileZilla.

Launch FileZilla > Click the "server icon" > "new site".

Set the following:
   - **Host**: Your VPS IP address
   - **Port**: 22
   - **Protocol**: SFTP
   - **Logging Type**: Key file
   - **User**: Ubuntu
   - **Key File**: Your saved private key
Connect and browse local files on the left side. Right-click on desired files > "upload".

Note: Remember the path of uploaded files for later.

### 3. Continuous Streaming Setup
Update yt.sh with your YouTube stream key, available on the YouTube live stream page of your channel.

SSH into your VPS and verify uploaded files:
```bash
ls
```
Install and launch screen to ensure the stream remains active even after closing the terminal:
```bash
sudo apt-get install screen
screen
```
### 4. Initiating the Live Stream

Before executing the script, ensure you grant it the necessary permissions:
```bash
chmod +x yt.sh
```
Now, execute the `yt.sh` script within the `screen` session:

```bash
./yt.sh
```
Your 24/7 live stream should now be broadcasting on YouTube!

### For Replit Users
The `main.py` script helps extend the time of the Replit bash console. Running this script on Replit ensures your console session remains active for a prolonged duration.

### Feedback, Contributions, and Support
Your input is invaluable to `ytstream`! Share feedback, suggestions, or collaborate by opening an issue or submitting a pull request.
