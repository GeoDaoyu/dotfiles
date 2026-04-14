# ============================================
# 1. Homebrew 初始化（必须放在最前面）
# ============================================
/opt/homebrew/bin/brew shellenv | source

# ============================================
# 2. Homebrew 设置
# ============================================
set -gx HOMEBREW_NO_INSTALL_CLEANUP TRUE
set -gx HOMEBREW_NO_ENV_HINTS 1

# ============================================
# 3. Starship 提示符
# ============================================
starship init fish | source

# ============================================
# 4. nvm (Node Version Manager)
# ============================================
set -gx NVM_DIR "$HOME/.nvm"
# nvm.fish 会通过 fisher 自动处理，不需要额外配置

# ============================================
# 5. pnpm
# ============================================
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not contains -- $PNPM_HOME $PATH
    set -gx PATH $PNPM_HOME $PATH
end

# ============================================
# 6. bun
# ============================================
set -gx BUN_INSTALL "$HOME/.bun"
if not contains -- $BUN_INSTALL/bin $PATH
    set -gx PATH $BUN_INSTALL/bin $PATH
end

# ============================================
# 7. autojump
# ============================================
if test -f "/opt/homebrew/share/autojump/autojump.fish"
    source "/opt/homebrew/share/autojump/autojump.fish"
end
