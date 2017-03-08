require 'i18n'
require 'const'

# load translation files
locales_dir = PROJECT_DIR.join('config', 'locales')
I18n.load_path += [
                    locales_dir.join('en.yml').to_s, 
                    locales_dir.join('ja.yml').to_s
                  ]

# config language here
I18n.config.available_locales = [:en, :ja]
I18n.locale = :ja
