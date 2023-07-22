nalafzf(){
sudo nala install $(apt list | cut --delimiter="/" --fields=1 | fzf --reverse --multi --preview="nala show {}")
}
