stage { 'preinstall':
  before => Stage['main']
}
 
class apt_get_update {
  exec { 'apt-get -y update':
    command => '/usr/bin/apt-get update',
    onlyif => "/bin/bash -c 'type -P apt-get'",
  }
}
 
class { 'apt_get_update':
  stage => preinstall
}

node default {
  include '::apt'
  include '::cron'
  include '::ntp'
  include '::postfix'
  #include '::sudo'
}
