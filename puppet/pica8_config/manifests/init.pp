# Class: pica8_config
#
# This module load pica8 configuration file
#
# Parameters: 
# - config_file - name of configuration file.
# - config_dir - dir on pica8 equipment
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class pica8_config (
  $config_file = 'puppet_pica.conf',
  $config_dir = '/pica/config/',
)
{
    file { "${::pica8_config::config_dir}":
        ensure => "directory",
    }
    file {"${::pica8_config::config_dir}${::pica8_config::config_file}":
        ensure  => present,
        source  => "puppet:///modules/pica8_config/${::pica8_config::config_file}",
        require => File["${::pica8_config::config_dir}"],
        notify  => Exec["load_config"],
    }

    exec { "load_config":
        command => "/pica/bin/cli -c \"configure;load override ${::pica8_config::config_dir}${::pica8_config::config_file}\""
    }



  

}
