BASE_DIR=$(cd $(dirname $0) && pwd)

ruby -I${BASE_DIR}/src/:${BASE_DIR}/config/ ${BASE_DIR}/src/main.rb $*
