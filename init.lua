--[[
=====================================================================
==================== MODULAR NEOVIM CONFIGURATION ===================
=====================================================================

This Neovim configuration is organized into modules for better maintainability.
Based on Kickstart.nvim but structured into separate files.

Directory Structure:
  - core/      - Essential Neovim settings and bootstrap
  - plugins/   - Plugin specifications by category
  - config/    - Plugin-specific configurations
  - after/     - Filetype-specific settings

Just run :checkhealth to see if everything is set up correctly.
]]--

-- Load the core modules
-- This will set up options, keymaps, autocommands, and bootstrap the plugin manager
require('core')
