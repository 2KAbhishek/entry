<div align = "center">

<h1><a href="https://github.com/2kabhishek/entry">entry</a></h1>

<a href="https://github.com/2KAbhishek/entry/blob/main/LICENSE">
<img alt="License" src="https://img.shields.io/github/license/2kabhishek/entry?style=flat&color=eee&label="> </a>

<a href="https://github.com/2KAbhishek/entry/graphs/contributors">
<img alt="People" src="https://img.shields.io/github/contributors/2kabhishek/entry?style=flat&color=ffaaf2&label=People"> </a>

<a href="https://github.com/2KAbhishek/entry/stargazers">
<img alt="Stars" src="https://img.shields.io/github/stars/2kabhishek/entry?style=flat&color=98c379&label=Stars"></a>

<a href="https://github.com/2KAbhishek/entry/network/members">
<img alt="Forks" src="https://img.shields.io/github/forks/2kabhishek/entry?style=flat&color=66a8e0&label=Forks"> </a>

<a href="https://github.com/2KAbhishek/entry/watchers">
<img alt="Watches" src="https://img.shields.io/github/watchers/2kabhishek/entry?style=flat&color=f5d08b&label=Watches"> </a>

<a href="https://github.com/2KAbhishek/entry/pulse">
<img alt="Last Updated" src="https://img.shields.io/github/last-commit/2kabhishek/entry?style=flat&color=e06c75&label="> </a>

<h3>Seamless Daily Entries 📝🪵</h3>

</div>

> entry is now archived, please check out [tdo](https://github.com/2kabhishek/tdo) for similar functionality

entry is a simple script that allows you to make daily entries/logs.

The purpose is to remove all barriers to Journaling and Note-taking.

It's as simple as running `entry`

## ✨ Features

- Automatically sets up an opinionated structure for notes
- Handles syncing with git, with timestamped commits, all async

## Setup

### ⚡ Requirements

You will need an environment variable pointing to the directory where you want to store entries.

for example:
```bash
export ENTRY_DIR="$HOME/Projects/Notes/Journal"
```

If `ENTRY_DIR` is not configured you can either pass an arg, or the current directory will be used for entries.

### 🚀 Installation

```bash
git clone https://github.com/2kabhishek/entry
cd entry
# Add a symlink to a directory on PATH
ln -sfnv $PWD/entry.sh $HOME/.local/bin/entry
```

### 💻 Usage

```bash
USAGE:
    entry [ENTRY_DIR]
Example:
    entry $HOME/Notes/Todos
    entry
```

##  Behind The Code

### 🌈 Inspiration

Wanted to start Journaling again but was missing my entries because of the overhead

### 💡 Challenges/Learnings

- I learned about async operations on bash and using git status in conditionals

### 🧰 Tooling

- [Macfiles](https://github.com/2kabhishek/Macfiles) — Dev Environment
- [nvim2k](https://github.com/2kabhishek/nvim2k) — Personalized Editor

### 🔍 More Info

- [committer](https://github.com/2kabhishek/committer) — a tool to quickly commit and sync git

<hr>

<div align="center">

<strong>⭐ hit the star button if you found this useful ⭐</strong><br>

<a href="https://github.com/2KAbhishek/entry">Source</a>
| <a href="https://2kabhishek.github.io/blog" target="_blank">Blog </a>
| <a href="https://twitter.com/2kabhishek" target="_blank">Twitter </a>
| <a href="https://linkedin.com/in/2kabhishek" target="_blank">LinkedIn </a>
| <a href="https://2kabhishek.github.io/links" target="_blank">More Links </a>
| <a href="https://2kabhishek.github.io/projects" target="_blank">Other Projects </a>

</div>

