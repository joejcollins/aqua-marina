# Install vscDebugger
if (!requireNamespace("vscDebugger", quietly = TRUE)) {
  install.packages(
    "vscDebugger",
    repos = "https://manuelhentschel.r-universe.dev"
  )
}
# Install all other dependencies from DESCRIPTION
renv::install()
