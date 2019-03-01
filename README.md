# vim-config

Peter's vim configurations. In order to use, a few things need to be done first. 
* If you already have a `.vimrc` file, back it up (e.g. `mv .vimrc .vimrc.bkup`) and then create a symlink to `init.vim` in this repo: `ln -s path/to/this/repo/init.vim ~/.vimrc`
* This configuration relies on [vim-plug](https://github.com/junegunn/vim-plug), which you can either get by following the instructions in its README, or by creating a symlink to  it that is provided in this repo: `ln -s path/to/this/repo/autoload ~/.vim/`
* I've also included some of my own snippets that [vim-snippets](https://github.com/honza/vim-snippets) picks up: `ln -s path/to/this/repo/snippets ~/.vim/`

## Commands to know

### From `a.vim`:

| Command | Description                                      |
|:--------|:-------------------------------------------------|
|`:A`     | Switch to the corresponding file                 |
|`:AS`    | Split horizontal and switch                      |
|`:AV`    | Split vertical and switch                        |
|`:AT`    | New tab and switch                               |
|`:AN`    | Cycles through matches                           |
|`:IH`    | Switch to file under cursor                      |
|`:IHS`   | Split horizontal and switch to file under cursor |
|`:IHV`   | Split vertical and switch to file under cursor   |
|`:IHT`   | New tab and switch to file under cursor          |
|`:IHN`   | Cycles through matches of file under cursor      |

There are leader-key commands as well, but I'm not including them here. Original repo can be found [here](https://github.com/vim-scripts/a.vim).

### From `mappings.vim`:

Note that the leader key has been set to `<Space>` in `init.vim`. I chose `<Space>` because either hand can hit that key, making it very versatile when one of your hands isn't at the keyboard. Finally, `<CR>` is the enter key. 
  
#### Utility

| Command         | Description                                     |
|:----------------|:------------------------------------------------|
|`<Leader>fs`     | `:w<CR>` - Write                                |
|`<Leader>sq `    | `:wq<CR>` - Write and quit                      |
|`<Leader>qq`     | `:q<CR>` - Quit                                 |
|`<Leader>fq`     | `:q!<CR>` - Quit without writing                |
|`<Leader>vs`     | `:vsplit` - Vertical split                      |
|`<Leader>hs`     | `:split` - Horizontal split                     |
|`<Leader>noh`    | `:noh<CR>` - Turn off highlighting after search |
|`<Leader>fzf`    | `:Files<CR>` - Launches the fuzzy finder        |

#### Navigation

| Command         | Description                                 |
|:----------------|:--------------------------------------------|
|`H`              | `10h`                                       |
|`J`              | `10j`                                       |
|`K`              | `10k`                                       |
|`L`              | `10l`                                       |
