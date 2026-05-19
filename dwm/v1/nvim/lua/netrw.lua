vim.keymap.set("n", "-", "<cmd>Explore<CR>", { noremap = true, desc = "Open netrw" })

vim.cmd([[
augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    nmap <buffer> l <CR>
    nmap <buffer> h -^
    nmap <buffer> <C-c> :bd!<CR>

    nmap <buffer> a %:w<CR>:buffer #<CR>
    nmap <buffer> y mc

    nmap <buffer> dx :call NetrwRemoveRecursive()<CR>
endfunction

function! NetrwRemoveRecursive()
  if &filetype ==# 'netrw'
    cnoremap <buffer> <CR> rm -r<CR>
    normal mu
    normal mf
    
    try
      normal mx
    catch
      echo "Canceled"
    endtry

    cunmap <buffer> <CR>
  endif
endfunction
]])
