cat > "Ripes.command" <<'EOF'
#!/bin/zsh
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
APP="$SCRIPT_DIR/Ripes-v2.2.6-77-g4981e31-mac-universal2.app"
BIN="$APP/Contents/MacOS/Ripes"

export QT_STYLE_OVERRIDE=Fusion
exec "$BIN"
EOF