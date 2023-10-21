# Setting Up Ubuntu for First-Time Use

## Table of Contents

1. [Introduction](#introduction)
    - [Author](#author)
    - [Target Audience](#target-audience)
2. [Environment Setup](#environment-setup)
    - [Ubuntu (Standalone or Subsystem)](#ubuntu-standalone-or-subsystem)
    - [Kernel in macOS](#kernel-in-macos)
3. [Shell Configuration](#shell-configuration)
    - [Zsh with Oh-My-Zsh](#zsh-with-oh-my-zsh)
4. [Editor Setup](#editor-setup)
    - [NeoVim](#neovim)
5. [References](#references)

---

## Introduction

This document aims to guide you through setting up an Ubuntu environment for the first time. It's suitable for both newcomers and those looking to reinstall Ubuntu.

### Author

- **Name**: HyeonMin Shin
- **GitHub**: [ShinMini](https://github.com/ShinMini)
- **Email**: [gusals121234@gmail.com](mailto:gusals121234@gmail.com)

### Target Audience

This guide targets the following users:

- New Ubuntu users
- Those installing Ubuntu as either a standalone OS or a subsystem within Windows
- Individuals interested in running the Ubuntu kernel on macOS

**Note**: If you're looking for a guide on how to set up a Linux subsystem in Windows, check out [this link](https://github.com/ShinMini/DEV-CONFIG-FOR-WINDOW/tree/version-6.1.0).

---

## Environment Setup

### Ubuntu (Standalone or Subsystem)

#### Package Management

1. **Update package list**:  
    ```bash
    sudo apt update
    ```
2. **Upgrade installed packages**:  
    ```bash
    sudo apt upgrade
    ```

#### Git Configuration

1. **Install Git**:  
    ```bash
    sudo apt install git
    ```
2. **Configure User Information**:  
    ```bash
    git config --global user.name "Your Name"
    git config --global user.email "youremail@example.com"
    ```

### Kernel in macOS

While Ubuntu runs on the Linux kernel, macOS operates on a Unix-based kernel called Darwin. Here's how you can set up a similar environment on macOS:

1. **Install Homebrew**:  
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

---

## Shell Configuration

### Zsh with Oh-My-Zsh

#### Installation

1. **Install Zsh**:  
    ```bash
    sudo apt install zsh
    ```
2. **Set Zsh as default shell**:  
    ```bash
    chsh -s $(which zsh)
    ```
3. **Install Oh-My-Zsh**:  
    ```bash
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

#### Plugin Configuration

To configure Oh-My-Zsh plugins:

1. **Edit the `~/.zshrc` file**:  
    ```bash
    nano ~/.zshrc
    ```
2. **Find the `plugins=( )` line and add your desired plugins inside the parentheses**:  
    ```bash
    plugins=(git z)
    ```
3. **Save and exit, then apply the changes**:  
    ```bash
    source ~/.zshrc
    ```

For a full list of available plugins, visit the [Oh-My-Zsh GitHub repository](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins).

---

## Editor Setup

### NeoVim

#### Installation and Configuration

1. **Install NeoVim**:  
    ```bash
    sudo apt install neovim
    ```
2. **Create a configuration file**:  
    ```bash
    mkdir -p ~/.config/nvim && touch ~/.config/nvim/init.vim
    ```
3. **Update your configuration file according to your preferences**:  
   - My personal sample file: [link](https://github.com/ShinMini/ShinMini/blob/mini/docs/config/init.vim)
   - Recommended auto-generator: [vim-bootstrap](https://vim-bootstrap.com/)

---

## References

- [Installing Zsh on Ubuntu](https://phoenixnap.com/kb/install-zsh-ubuntu)
- [Oh-My-Zsh Installation](https://ohmyz.sh/#install)

