# telescope-http.nvim

Quickly investigate HTTP status codes with the help of
[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
and [mozilla](https://developer.mozilla.org/en-US/docs/Web/HTTP).

## Installation

Install via your favorite package manager, like [paq](https://github.com/savq/paq-nvim):

```lua
require 'paq' {
    'savq/paq-nvim',
    'barrett-ruth/telescope-http.nvim'
}
```

Then load the extension:

```lua
require('telescope').load_extension 'http'
```

## Dependencies

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

## Configuration

```lua
require('telescope').setup {
    extensions = {
        http = {
            -- How the mozilla url is opened. By default will be configured based on OS:
            open_url = 'xdg-open %s' -- UNIX
            -- open_url = 'open %s' -- OSX
            -- open_url = 'start %s' -- Windows
        }
    }
}
```

## Usage

Creating a mapping for the following command in vim:

```vim
:Telescope http list
```

or lua:

```lua
require('telescope').extensions.http.list()
```
