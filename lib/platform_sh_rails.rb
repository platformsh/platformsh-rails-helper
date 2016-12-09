require "platform_sh_rails/version"
require "platform_sh"
require "open-uri"
require 'rails/generators'


class PlatformSHRailtie < Rails::Railtie
  config.before_configuration do
    if ENV['TMPDIR'].nil?
      ENV['TMPDIR']="/tmp"
    end
    if PlatformSH::on_platform? && !PlatformSH::is_build_environment?
      PlatformSH::export_services_urls
    end
    if PlatformSH::on_platform? && PlatformSH::is_build_environment?
      ENV['DB_ADAPTER']="nulldb"  
      ENV['DATABASE_URL']="nulldb://localhost/nulldb?pool=5"
    end
    ENV['RAILS_SERVE_STATIC_FILES']="true"
    ENV['RAILS_LOG_TO_STDOUT']="true"
    ENV['SECRET_KEY_BASE']=ENV['PLATFORM_PROJECT_ENTROPY']
  end
end
class PlatformConfigGenerator < Rails::Generators::Base
  desc "This generator creates the basic configuration files to run rails on platform.sh"
  def create_config_configuration
    platform_yaml =  open('https://raw.githubusercontent.com/platformsh/platformsh-example-rails/master/.platform.app.yaml') {|f| f.read }
    routes_yaml= open('https://raw.githubusercontent.com/platformsh/platformsh-example-rails/master/.platform/routes.yaml') {|f| f.read }
    services_yaml= open('https://raw.githubusercontent.com/platformsh/platformsh-example-rails/master/.platform/services.yaml') {|f| f.read }
    create_file ".platform.app.yaml", platform_yaml
    empty_directory ".platform"
    create_file ".platform/routes.yaml", routes_yaml
    create_file ".platform/services.yaml", services_yaml
  end
end

