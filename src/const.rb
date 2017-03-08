require 'etc'
require 'pathname'

PROJECT_DIR = Pathname(__dir__).join("../")
DATA_DIR = PROJECT_DIR.join("data")
MY_DIR = DATA_DIR.join(Etc.getlogin)

