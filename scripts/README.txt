Lab 03 — Git in Depth
DevOps Principles and Practices (2+1)

WHAT IS IN HERE

  make-bisect-repo.sh   Task 5 — creates the 16-commit repository you will
                        search with git bisect. Run it; do not read it until
                        after you have found the bad commit, or you spoil the
                        exercise.

  fallback/             A working Lab 02 Makefile and src/ inputs, for anyone
                        who no longer has their own Lab 02 work. USE YOUR OWN
                        IF YOU HAVE IT. If you use this instead, say so in
                        your report — it is not a penalty, but we need to know.

Everything else in this lab you type yourself from the manual. That is
deliberate: the outcome being assessed is precision in operating the tool, and
a student who pastes finished commands has demonstrated nothing.

HOW TO USE THESE FILES

  1. Copy them into your Linux home directory. From your Ubuntu terminal,
     replacing WINUSER with your Windows username:

        mkdir -p ~/devops/lab03
        cp -r /mnt/c/Users/WINUSER/Downloads/scripts/*  ~/devops/lab03/
        cd ~/devops/lab03

  2. Repair the line endings. Files that travel through Windows, WhatsApp or
     Teams often arrive with Windows line endings, which stop them running.
     Harmless if they are already correct, so always run it:

        sed -i 's/\r$//' make-bisect-repo.sh fallback/Makefile fallback/src/*.txt

  3. Make the script executable:

        chmod +x make-bisect-repo.sh

  4. Bring in your own Lab 02 work (preferred):

        cp -r ~/devops/lab02/Makefile ~/devops/lab02/src  .

     Only if you do not have it:

        cp -r fallback/Makefile fallback/src  .

  5. Check it runs BEFORE you start Task 1:

        make ci

BEFORE YOU DO ANYTHING ELSE

  Git will refuse to commit until it knows who you are. Set this once:

        git config --global user.name  "Your Name"
        git config --global user.email "your.email@example.com"
        git config --global init.defaultBranch main
        git config --global core.editor nano

  The last line matters. In Task 4 Git opens an editor and waits. If that
  editor turns out to be vim and you have not used it, you will lose ten
  minutes working out how to leave. In nano: Ctrl+O then Enter to save,
  Ctrl+X to exit.

THE ONE THING THAT WILL COST YOU TWENTY MINUTES

  Recipe lines in a Makefile MUST begin with a real TAB, never spaces. If you
  copy a Makefile out of the PDF you get spaces, and make refuses to run:

        Makefile:2: *** missing separator.  Stop.

  Check what you actually typed:

        cat -A Makefile          # a real tab appears as ^I

SUBMISSION

  Zip the WHOLE lab03 folder, including the hidden .git directory — that is
  where the marks are:

        cd ~/devops
        zip -r Lab03_<your-roll-number>.zip lab03
        unzip -l Lab03_<your-roll-number>.zip | grep -c '\.git/'

  That last command must print a number greater than zero.

IMPORTANT
  Do NOT open these files in Notepad, WordPad or Word.
  Follow the lab manual (Lab03_Git_in_Depth.pdf).
