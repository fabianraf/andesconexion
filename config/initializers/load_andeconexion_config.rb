# Loads into ANDESCONEXION_CONFIG the yml file for andesconexion_config -Fabian
ANDES_CONFIG = YAML.load_file("#{Rails.root}/config/andesconexion_config.yml")[Rails.env]
