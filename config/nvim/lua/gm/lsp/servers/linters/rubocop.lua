local rubocop = {
  lintCommand = "rubocop-daemon-wrapper --no-color --stdin ${INPUT} --force-exclusion",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {
    "%f:%l:%c: %t: %m"
  },
}

return rubocop
