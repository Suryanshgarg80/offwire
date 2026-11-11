# Offwire

A private AI for the files on your Mac. Ask it to find something, or to brief you on a
file, and it answers with the page it came from. It runs on your Mac: your files and
questions are not uploaded.

**This is a beta, made by one person.** I'd like to know what breaks and what's missing.

## Install

You need an Apple Silicon Mac (M1 or newer), macOS 14 or newer, 8 GB of memory and about
4 GB of free disk space. Open Terminal and paste:

```bash
curl -fsSL https://raw.githubusercontent.com/Suryanshgarg80/offwire/main/install.sh | bash
```

[`install.sh`](install.sh) is short; read it first if you like. It downloads the release
from this repository, checks its SHA-256, and installs into `~/.offwire` and
`~/Applications/Offwire.app`. It never asks for an admin password.

Offwire opens in your browser in about two minutes and can search straight away. The AI
model (2.5 GB, Qwen3-4B) downloads in the background; written answers start when it's done.

## What it does

- **Searches your whole home folder with nothing to import.** It uses Spotlight, the Mac's
  own search, then reads the best-matching files.
- **Briefs you on a file** by reading the file itself, and says how much of it it read.
- **Checks its own numbers.** Every number in an answer is looked up in your files; one
  that isn't there is underlined, and it names the file each number came from.
- **Fixes typos** and tells you what it searched for.
- **Optional:** a switch that lets the Claude desktop app search your files through Offwire.
  It's off by default, because what Claude finds is sent to Anthropic.

## What to know before you try it

- **It's slow on 8 GB.** Passages appear in 2–6 seconds, an answer takes 10–20, and a brief
  of a file takes 25–40. Follow-up questions on the same file start in under a second.
- **It makes mistakes.** The model is small. On a long file it reads only part, and can
  miss what's on a later page. Check anything that matters.
- **It reads your personal files**, on your Mac only. Hidden folders, apps, and files named
  like passwords or keys are skipped. You can turn whole-Mac search off under System.
- **It isn't signed by Apple**, which is why it installs from Terminal.
- **The source isn't public.** The release contains compiled modules. The connector script
  that another app runs is plain, readable Python.
- **It sends nothing home**, so I only learn what you tell me.

## Remove it

```bash
~/.offwire/app/offwire.sh uninstall
```

## Feedback

Open an [issue](https://github.com/Suryanshgarg80/offwire/issues) and tell me what you
asked that it got wrong, where it froze, or what you expected it to do. Under **System**,
**Copy report** gives a status report with no file names or document text.

[License and terms](LICENSE-BETA.txt) (beta, draft).
