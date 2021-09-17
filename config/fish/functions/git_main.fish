function git_main_branch
  git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'
end

function git_origin_main_branch
  git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/@@'
end
