#!/bin/sh
if [ -n "${FRAGMENT_CALLS_LOG:-}" ]; then
  basename "$1" >> "$FRAGMENT_CALLS_LOG"
fi
case "$1" in
  */fragment-target.md|fragment-target.md)
    if [ -n "${FAIL_FRAGMENT_TARGET:-}" ]; then
      echo "target preprocessor failed" >&2
      exit 7
    fi
    printf '# Prepared\n\n## Other\n' ;;
  */fragment-source.md|fragment-source.md)
    printf '# Built\n\n'
    cat "$1" ;;
  *) cat "$1" ;;
esac
