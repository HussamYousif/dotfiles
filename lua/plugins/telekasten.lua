return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- Calendar support
      "renerocksai/calendar-vim",
    },
    keys = {
      -- Main command to open Telekasten panel
      { "<leader>t", "<cmd>Telekasten panel<cr>", desc = "Telekasten Panel" },

      -- Note operations
      { "<leader>tn", "<cmd>Telekasten new_note<cr>", desc = "New Note" },
      { "<leader>tt", "<cmd>Telekasten find_notes<cr>", desc = "Find Notes" },
      { "<leader>tg", "<cmd>Telekasten search_notes<cr>", desc = "Grep Notes" },
      { "<leader>td", "<cmd>Telekasten goto_today<cr>", desc = "Today's Daily Note" },
      { "<leader>tw", "<cmd>Telekasten goto_thisweek<cr>", desc = "This Week's Note" },
      { "<leader>tz", "<cmd>Telekasten follow_link<cr>", desc = "Follow Link" },

      -- Daily/Weekly notes
      { "<leader>tD", "<cmd>Telekasten find_daily_notes<cr>", desc = "Find Daily Notes" },
      { "<leader>tW", "<cmd>Telekasten find_weekly_notes<cr>", desc = "Find Weekly Notes" },

      -- Tags and links
      { "<leader>tT", "<cmd>Telekasten show_tags<cr>", desc = "Show Tags" },
      { "<leader>tb", "<cmd>Telekasten show_backlinks<cr>", desc = "Show Backlinks" },
      { "<leader>tl", "<cmd>Telekasten insert_link<cr>", desc = "Insert Link" },
      { "<leader>to", "<cmd>Telekasten toggle_todo<cr>", desc = "Toggle Todo" },

      -- Calendar - using CalendarT specifically for Telekasten
      { "<leader>tc", "<cmd>CalendarT<cr>", desc = "Show Calendar" },

      -- Rename note
      { "<leader>tr", "<cmd>Telekasten rename_note<cr>", desc = "Rename Note" },

      -- Additional useful commands
      { "<leader>ti", "<cmd>Telekasten insert_img_link<cr>", desc = "Insert Image" },
      { "<leader>tp", "<cmd>Telekasten preview_img<cr>", desc = "Preview Image" },
      { "<leader>tm", "<cmd>Telekasten browse_media<cr>", desc = "Browse Media" },
      { "<leader>ta", "<cmd>Telekasten show_tags<cr>", desc = "All Tags" },
      { "<leader>tI", "<cmd>Telekasten paste_img_and_link<cr>", desc = "Paste Image" },
      { "<leader>tN", "<cmd>Telekasten new_templated_note<cr>", desc = "New Note from Template" },
    },
    config = function()
      local home = vim.fn.expand("~/notes") -- System-wide notes directory

      -- Ensure Telescope is loaded first
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
      })

      require("telekasten").setup({
        home = home,

        -- Daily notes
        dailies = home .. "/daily",
        weeklies = home .. "/weekly",
        templates = home .. "/templates",

        -- Image handling
        image_subdir = "images",

        -- Extension for notes
        extension = ".md",

        -- Generate note filenames
        new_note_filename = "title",
        uuid_type = "%Y%m%d%H%M",
        uuid_sep = "-",

        -- Following links
        follow_creates_nonexisting = true,
        dailies_create_nonexisting = true,
        weeklies_create_nonexisting = true,

        -- Template files
        template_new_note = home .. "/templates/new_note.md",
        template_new_daily = home .. "/templates/daily.md",
        template_new_weekly = home .. "/templates/weekly.md",

        -- Image link style
        image_link_style = "markdown",

        -- Sort
        sort = "filename",

        -- UI
        show_tags_theme = "dropdown",

        -- Calendar integration
        plug_into_calendar = true,
        calendar_opts = {
          weeknm = 4,
          calendar_monday = 1,
          calendar_mark = "left-fit",
        },

        -- Command palette theme
        command_palette_theme = "dropdown",

        -- Tags
        tag_notation = "#tag",

        -- Subdirectories
        subdirs_in_links = true,

        -- Note naming
        new_note_location = "smart",
        rename_update_links = true,

        -- Journal
        journal_auto_open = false,

        -- Preview
        media_previewer = "telescope-media-files",

        -- Markdown highlighting
        install_syntax = true,
        syntax = "markdown",

        -- File handling
        auto_set_filetype = true,
        auto_set_syntax = true,
      })

      -- Create notes directory structure if it doesn't exist
      local dirs = {
        home,
        home .. "/daily",
        home .. "/weekly",
        home .. "/templates",
        home .. "/images",
        home .. "/projects",
        home .. "/archive",
      }

      for _, dir in ipairs(dirs) do
        vim.fn.mkdir(dir, "p")
      end

      -- Create default templates if they don't exist
      local function create_template(path, content)
        if vim.fn.filereadable(path) == 0 then
          local file = io.open(path, "w")
          if file then
            file:write(content)
            file:close()
          end
        end
      end

      -- New note template
      create_template(
        home .. "/templates/new_note.md",
        [[---
title: {{title}}
date: {{date}}
tags: []
---

# {{title}}

## Notes

]]
      )

      -- Daily note template
      create_template(
        home .. "/templates/daily.md",
        [[---
title: Daily Note - {{date}}
date: {{date}}
tags: [daily]
---

# {{date}}

## Tasks
- [ ] 

## Schedule

### Morning

### Afternoon

### Evening

## Notes

## Journal

## Tomorrow's Priority

]]
      )

      -- Weekly note template
      create_template(
        home .. "/templates/weekly.md",
        [[---
title: Week {{date}}
date: {{date}}
tags: [weekly]
---

# Week {{date}}

## Goals for this week
- [ ] 

## Monday

## Tuesday

## Wednesday

## Thursday

## Friday

## Weekend

## Week Review
### What went well?

### What could be improved?

### Next week's focus

]]
      )

      -- Set up autocommands for Telekasten
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          -- Only apply to files in notes directory
          if vim.fn.expand("%:p"):match(home) then
            vim.opt_local.conceallevel = 0
            vim.opt_local.wrap = true
            vim.opt_local.linebreak = true
          end
        end,
      })
    end,
  },

  -- Calendar plugin - use renerocksai's fork for better Telekasten integration
  {
    "renerocksai/calendar-vim",
    lazy = false, -- Load immediately for better integration
    init = function()
      -- Calendar configuration
      vim.g.calendar_no_mappings = 1 -- Disable default calendar mappings to prevent conflicts
      vim.g.calendar_monday = 1
      vim.g.calendar_weeknm = 4 -- Show week numbers
      vim.g.calendar_mark = "left-fit"
      vim.g.calendar_diary = vim.fn.expand("~/notes/daily")
    end,
  },

  -- Optional: Better markdown concealing and preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      { "<leader>tp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
  },
}
