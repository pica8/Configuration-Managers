# Class: pica8_config
The puppet module uploads config file to PicOS network equipment and applies the config

# Parameters: 

* config_file - The parameter sets name of config file. The config file must be located in "/Infrustructure/pica8_config/files" folder of the repository before running the module. Default value is "puppet_pica.conf". And the file was uploaded to "files" folder
* config_dir - The parameter sets path of directory for saving configuration files. Default value is "/pica/config/".

# Details

The puppet module runs next command for appling uploaded config file if default values of parameters aren't changed:
```bash
/pica/bin/cli -c "configure;load override /pica/config/puppet_pica.conf"
```
