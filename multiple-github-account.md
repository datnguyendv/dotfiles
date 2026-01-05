# Git Multi-Account Configuration Guide

This guide explains how to manage two separate Git identities (Work and Personal) on the same machine by separating **Authentication (SSH)** and **Attribution (User Identity)**.

## 1\. SSH Configuration (Authentication)

This determines which "key" is used to push/pull code to GitHub.

**File:** `~/.ssh/config`

```
# Work Account (Default)
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_company
    AddKeysToAgent yes
    UseKeychain yes
    IdentitiesOnly yes

# Personal Account (Using Alias)
Host github.com-datnguyendv
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_personal
    AddKeysToAgent yes
    UseKeychain yes
    IdentitiesOnly yes
```

`**How to use:** When cloning a personal repository, modify the host in the URL:`

```
# Instead of: git clone git@github.com:username/repo.git
git clone git@github.com-datnguyendv:username/repo.git
```

## 2\. Git Identity Configuration (Commit Signature)

This determines the Name and Email shown in the commit history on GitHub's UI.

### Option A: Automatic

Automatically switch identities based on the folder path.

**Step 1: Edit Global Config** (`~/.gitconfig`)

```
[user]
    name = company-name
    email = company-email

# If the repository is inside the "Personal" folder, use a different config
[includeIf "gitdir:~/Code/Personal/"]
    path = ~/.gitconfig-personal
```

**Step 2: Create Personal Config** (`~/.gitconfig-personal`)

```
[user]
    name = datnguyendv
    email = your-personal-email@gmail.com
```

### Option B: Manual (Per Repository)

Run this inside a specific repository folder:

```
git config user.name "datnguyendv"
git config user.email "your-personal-email@gmail.com"
```
