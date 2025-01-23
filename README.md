# mac-setup

This script automates the setup of a macOS development environment, including the installation of Homebrew, Oh My Zsh, Powerlevel10k theme, zsh plugins, Git configuration, and SSH key generation.

## Features

- Installs Homebrew
- Installs Oh My Zsh
- Installs Powerlevel10k theme for Zsh
- Installs zsh-autosuggestions and zsh-syntax-highlighting plugins
- Configures Git with your user details
- Generates an SSH key and adds it to the SSH agent
- Copies the SSH key to the clipboard for easy addition to GitHub
- Shows hidden files in Finder

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/shreehari06/mac-setup.git
   cd mac-setup
   ```

2. Make the script executable:

   ```bash
   chmod +x setup.sh
   ```

3. Update config.txt

   ```bash
   GIT_USERNAME="Shreehari Thakral"
   GIT_EMAIL="shreehari_thakral@mckinsey.com"
   ```

4. Run the script:

   ```bash
   ./setup.sh
   ```

5. Follow the on-screen instructions to complete the setup.

## Post-Setup

- Add the copied SSH key to your GitHub account: [GitHub SSH settings](https://github.com/settings/keys)
- Restart your terminal to apply the changes.

## Notes

- The script assumes the use of the `ed25519` algorithm for SSH key generation.
- The script modifies your `.zshrc` file to include the Powerlevel10k theme and zsh plugins.
- The script configures Git with the provided user name and email.

## License

This project is licensed under the MIT License.
