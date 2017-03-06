require 'etc'
require 'pathname'

DATA_DIR = Pathname.pwd.join("data")
MY_DIR = DATA_DIR.join(Etc.getlogin)

