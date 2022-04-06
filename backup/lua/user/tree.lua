

require'nvim-tree'.setup {
	disable_netrw        = false,
	hijack_netrw         = true,
	open_on_setup        = false,
	ignore_buffer_on_setup = false,
	ignore_ft_on_setup   = {},
	hijack_directories   = {
		enable = true,
		auto_open = true,
	},
	auto_close           = false,
	auto_reload_on_write = true,
	open_on_tab          = false,
	hijack_cursor        = false,
	update_cwd           = true,
	hijack_unnamed_buffer_when_opening = false,
	diagnostics          = {
		enable = false,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	update_focused_file = {
		enable      = true,
		update_cwd  = true,
	},
	system_open = {
		cmd  = nil,
		args = {}
	},
	git = {
		enable = true,
		ignore = true,
	},
	view = {
		width = 30,
		height = 30,
		side = 'left',
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {}
		}
	},
	filters = {
		dotfiles = false,
		custom = {}
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	actions = {
		change_dir = {
			enable = true,
			global = false,
		},
		open_file = {
quit_on_open = false,
resize_window = false,
window_picker = {
	enable = true,
	chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
	exclude = {
		filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
		buftype  = { "nofile", "terminal", "help", },
	}
}
		},
	}
}
