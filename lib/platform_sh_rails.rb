require "platform_sh_rails/version"
require "platform_sh"
require "uri"

module PlatformSHRails
  # PlatformSH Railtie to load environment 
  class Railtie < Rails::Railtie

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

      config.before_initialize do
          PlatformSH::config["routes"].select {|k,v| v["type"]=="upstream"}.keys[0].uniq.each{|url| config.hosts <<  URI.parse(url).host}
      end
    end
end