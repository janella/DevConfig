# DevConfig

Setup for Janella's dev environment and command line.

I use Powershell on Windows Terminal and I don't really have a fancy setup. 

## Fresh machine setup

1. Clone this repository.
2. Follow steps 1 and 3 in [Scott Hanselman's blog Windows Terminal blog](https://www.hanselman.com/blog/how-to-make-a-pretty-prompt-in-windows-terminal-with-powerline-nerd-fonts-cascadia-code-wsl-and-ohmyposh).
3. Edit `settings.json` and `Microsoft.PowerShell_profile.ps1` and make sure the various directory paths are in the right place (eg `C:/` or `D:/`).
4. Run `./CopyToSettings.ps1` to copy all of the styles etc. 
    * Using the argument `-ReplaceProfile` will replace the current Powershell profile with the one in this repo.
    * If you're not me and have stuff in your `Microsoft.Powershell_profile.ps1` you want to keep, then you might not want to do this. 😇 Feel free to check your local by running `notepad $PROFILE`.

## Updating this repository
If I make any local edits/updates to my setup, I don't want to faff around copying to this repo, so I wrote a script for it.

1. Run `./CopyToSettings.ps1` to copy all of the bits in this repo.
    * Using the argument `-ReplaceProfile` will also copy over the Powershell profile, as above.
2. Fix anything you need to before committing and updating.

# Handy reminders because I always forget
> `$PROFILE` - Get the location of your Powershell Profile.