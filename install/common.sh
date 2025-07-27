#!/usr/bin/env bash

# =====================
# hayloft common utils 🌾
# =====================

set -e

# --- Logging functions with farmer-themed emojis ---
log_hay()   { echo -e "🌾 $1"; }
log_duck()  { echo -e "🦆 $1"; }
log_saw()   { echo -e "🪚 $1"; }
log_rake()  { echo -e "🧺 $1"; }
log_chicken(){ echo -e "🐓 $1"; }
log_error() { echo -e "🐖 ERROR: $1" >&2; }

# --- OS + Package Manager Detection ---
prompt_package_manager() {
    if [[ "$(uname)" == "Darwin" ]]; then
        PM="brew"
    elif command -v apt &>/dev/null; then
        PM="apt"
    elif command -v yum &>/dev/null; then
        PM="yum"
    elif command -v dnf &>/dev/null; then
        PM="dnf"
    else
        log_error "Unsupported system. Please install dependencies manually."
        exit 1
    fi
    log_rake "Detected package manager: $PM"
}

# --- Run install script with package manager ---
run_with_pm() {
    pkg_name="$1"
    script="$2"

    if ! command -v "$pkg_name" &>/dev/null; then
        read -p "🪓 $pkg_name not found. Install it with $PM? (y/n): " confirm
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
            case "$PM" in
                apt) sudo apt update && sudo apt install -y "$pkg_name" ;;
                yum) sudo yum install -y "$pkg_name" ;;
                dnf) sudo dnf install -y "$pkg_name" ;;
                brew) brew install "$pkg_name" ;;
                *) log_error "Unsupported package manager: $PM" && exit 1 ;;
            esac
        else
            log_error "Skipping $pkg_name installation."
            return
        fi
    else
        log_chicken "$pkg_name is already installed."
    fi

    bash "$script"
}

