@echo off
if defined FRAGMENT_CALLS_LOG echo %~nx1>> "%FRAGMENT_CALLS_LOG%"
if /I "%~nx1"=="fragment-target.md" (
  if defined FAIL_FRAGMENT_TARGET goto :target_error
  echo # Prepared
  echo.
  echo ## Other
) else (
  if /I "%~nx1"=="fragment-source.md" (
    echo # Built
    echo.
  )
  type "%~1"
)
exit /b 0

:target_error
echo target preprocessor failed 1>&2
exit /b 7
