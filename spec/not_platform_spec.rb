require 'spec_helper'

describe "Platform.sh  Rails helper when not on platform instance" do
  before(:all) do
      ENV.clear["PLATFORM_APPLICATION"]
      ENV.clear["PLATFORM_APPLICATION_NAME"]
      ENV.clear["PLATFORM_APP_COMMAND"]
      ENV.clear["PLATFORM_APP_DIR"]
      ENV.clear["PLATFORM_DIR"]
      ENV.clear["PLATFORM_DOCUMENT_ROOT"]
      ENV.clear["PLATFORM_ENVIRONMENT"]
      ENV.clear["PLATFORM_PROJECT"]
      ENV.clear["PLATFORM_PROJECT_ENTROPY"]
      ENV.clear["PLATFORM_RELATIONSHIPS"]
      ENV.clear["PLATFORM_ROUTES"]
      ENV.clear["PLATFORM_TREE_ID"]
      ENV.clear["PLATFORM_VARIABLES"]
      ENV.clear["PORT"]
      @config = PlatformSH::config
    end

    it 'config is nil when not running on platform' do
      skip "Later" do
      end
    end

    it 'does not fail when running in envs other than Platform' do
      skip "Later" do
      end
    end
  
end
