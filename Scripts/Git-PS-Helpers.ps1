# I stole `gpr`, `gsync`, `gnew`, `gpull/push`, and `gsweep` from @arical 🤗

function gpr {
    $branch = &git rev-parse --abbrev-ref HEAD
    if ($branch -eq "master")
    {
        throw "You can't create a pull request off master, dummy!"
    }
    gpush
    $remote = &git remote get-url --push origin

    $pr_url = $remote.Replace(".git", "")
    Start-Process Chrome "$pr_url/pull/new/$branch"
}

function gsync {
    git fetch origin master:master
}

function gnew {
    git fetch
    $branch = &git rev-parse --abbrev-ref HEAD
    git checkout -b $args origin/master
    git branch -d $branch
    git branch --unset-upstream # don't track master so we don't default to pushing master :)
}

function gpull {
    git fetch
    $branch = &git rev-parse --abbrev-ref HEAD
    git pull origin $branch --rebase
}

function gpush {
    $branch = &git rev-parse --abbrev-ref HEAD 
    git push origin $branch
}

function gsweep {
    git branch --merged |
      ForEach-Object { $_.Trim() } |
      Where-Object {$_ -NotMatch "^\*"} |
      Where-Object {-not ( $_ -Like "*master" )} |
      ForEach-Object { git branch -d $_ }
}

# https://stackoverflow.com/questions/2719579/how-to-add-a-changed-file-to-an-older-not-last-commit-in-git
function gpatch ($numCommitsBack) {
    git stash
    git rebase -i HEAD~$numCommitsBack
    git stash pop
}

function gpatch-continue {
    git add .
    git commit --amend --no-edit
    git rebase --continue
}