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
5. [Additional Tools](#additional-tools)
6. [Conclusion](#conclusion)
7. [References](#references)

---

## Introduction

This document aims to guide you through the process of setting up your Ubuntu environment for the first time. Whether you're new to Ubuntu or setting up a new system, this guide has got you covered.

### Author
- **Name**: HyeonMin Shin
- **GitHub**: [ShinMini](https://github.com/ShinMini)
- **Email**: [gusals121234@gmail.com](mailto:gusals121234@gmail.com)

### Target Audience

This guide is aimed at:
- Users who are new to Ubuntu
- Users setting up Ubuntu as a standalone OS or as a subsystem in Windows
- Users interested in running Ubuntu kernel in macOS
- If you looking for "How to set up the Linux subsystem in the window": I highly recommend checking this [link: config-for-window](https://github.com/ShinMini/DEV-CONFIG-FOR-WINDOW/tree/version-6.1.0)
---

## Environment Setup

### Ubuntu (Standalone or Subsystem)

1. Update package list:  
    ```bash
    sudo apt update
    ```
2. Upgrade installed packages:  
    ```bash
    sudo apt upgrade
    ```

// TODO: Add additional steps specific to your setup

### Kernel in macOS

// TODO: Insert instructions on setting up Ubuntu kernel in macOS

---

## Shell Configuration

### Zsh with Oh-My-Zsh

1. Install Zsh:  
    ```bash
    sudo apt install zsh
    ```
2. Set Zsh as default shell:  
    ```bash
    chsh -s $(which zsh)
    ```
3. Install Oh-My-Zsh:  
    ```bash
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

// TODO: Add any additional plugins or themes you use

---

## Editor Setup

### NeoVim

1. Install NeoVim:  
    ```bash
    sudo apt install neovim
    ```
2. Create a config file:  
    ```bash
    mkdir -p ~/.config/nvim && touch ~/.config/nvim/init.vim
    ```

// TODO: Add any plugins or configuration settings you typically use

---

## Additional Tools

// TODO: List any other software or tools you commonly use

---

## Conclusion

This guide is meant to provide a quick and straightforward way to set up your Ubuntu environment. Feel free to adapt these guidelines according to your needs.

---

## References

[How to Install Zsh...
](https://phoenixnap.com/kb/install-zsh-ubuntu)https://phoenixnap.com/kb/install-zsh-ubuntu
