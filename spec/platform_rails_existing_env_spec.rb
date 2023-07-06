require 'spec_helper'
require 'byebug'

describe "Platform.sh configuration helper" do

  before(:all) do
    ENV["PLATFORM_APPLICATION"]="eyJyZWxhdGlvbnNoaXBzIjogeyJkYXRhYmFzZSI6ICJkYXRhYmFzZTpteXNxbCJ9LCAid2ViIjogeyJtb3ZlX3RvX3Jvb3QiOiBmYWxzZSwgImNvbW1hbmRzIjogeyJzdGFydCI6ICJ1bnNldCBQT1JUOyB1bmljb3JuIC1sIC9ydW4vYXBwLnNvY2sgLUUgcHJvZHVjdGlvbiBjb25maWcucnUiLCAic3RvcCI6IG51bGx9LCAibG9jYXRpb25zIjogeyIvIjogeyJwYXNzdGhydSI6IHRydWUsICJydWxlcyI6IHt9LCAiZXhwaXJlcyI6ICIxaCIsICJhbGxvdyI6IHRydWUsICJzY3JpcHRzIjogdHJ1ZSwgInJvb3QiOiAicHVibGljIn19fSwgImRpc2siOiAyMDQ4LCAibmFtZSI6ICJteXJ1YnlhcHAiLCAiaG9va3MiOiB7ImJ1aWxkIjogImdlbSBpbnN0YWxsIGJ1bmRsZXJcbmJ1bmRsZSBpbnN0YWxsIC0tam9icyA2IC0td2l0aG91dCBkZXZlbG9wbWVudCB0ZXN0XG4iLCAiZGVwbG95IjogIlJBQ0tfRU5WPXByb2R1Y3Rpb24gYnVuZGxlIGV4ZWMgcmFrZSBkYjptaWdyYXRlIn0sICJjcm9ucyI6IHt9LCAiYWNjZXNzIjogeyJzc2giOiAiY29udHJpYnV0b3IifSwgImRlcGVuZGVuY2llcyI6IHt9LCAicHJlZmxpZ2h0IjogeyJlbmFibGVkIjogdHJ1ZSwgImlnbm9yZWRfcnVsZXMiOiBbXX0sICJidWlsZCI6IHsiZmxhdm9yIjogbnVsbH0sICJtb3VudHMiOiB7Ii90bXAiOiAic2hhcmVkOmZpbGVzL3RtcCIsICIvbG9nIjogInNoYXJlZDpmaWxlcy9sb2cifSwgInRpbWV6b25lIjogbnVsbCwgInJ1bnRpbWUiOiB7fSwgInR5cGUiOiAicnVieS1uaWdodGx5OjIuMyIsICJzaXplIjogIkFVVE8ifQ=="
    ENV["PLATFORM_APPLICATION_NAME"]="myrubyapp"
    ENV["PLATFORM_APP_COMMAND"]="unset PORT; unicorn -l /run/app.sock -E production config.ru"
    ENV["PLATFORM_APP_DIR"]="/app"
    ENV["PLATFORM_DIR"]="/app"
    ENV["PLATFORM_DOCUMENT_ROOT"]="/app/public"
    ENV["PLATFORM_ENVIRONMENT"]="rails"
    ENV["PLATFORM_PROJECT"]="u3cwg2o536mh6"
    ENV["PLATFORM_PROJECT_ENTROPY"]="FUXBXYV6ULYBRJFMNJ5F74FBJUF4ZRJSEFMRY5UPIJLLFUGWXO6Q===="
    ENV["PLATFORM_RELATIONSHIPS"]="eyJkYXRhYmFzZSI6IFt7InVzZXJuYW1lIjogInVzZXIiLCAicGFzc3dvcmQiOiAiIiwgImlwIjogIjI0Ni4wLjI0MS41MCIsICJob3N0IjogImRhdGFiYXNlLmludGVybmFsIiwgInF1ZXJ5IjogeyJpc19tYXN0ZXIiOiB0cnVlfSwgInBhdGgiOiAibWFpbiIsICJzY2hlbWUiOiAibXlzcWwiLCAicG9ydCI6IDMzMDZ9XX0="
    ENV["PLATFORM_ROUTES"]="eyJodHRwczovL3JhaWxzLXUzY3dnMm81MzZtaDYuZXUucGxhdGZvcm0uc2gvIjogeyJjYWNoZSI6IHsiZGVmYXVsdF90dGwiOiAwLCAiY29va2llcyI6IFsiKiJdLCAiZW5hYmxlZCI6IHRydWUsICJoZWFkZXJzIjogWyJBY2NlcHQiLCAiQWNjZXB0LUxhbmd1YWdlIl19LCAic3NpIjogeyJlbmFibGVkIjogZmFsc2V9LCAib3JpZ2luYWxfdXJsIjogImh0dHBzOi8ve2RlZmF1bHR9LyIsICJ1cHN0cmVhbSI6ICJteXJ1YnlhcHAiLCAidHlwZSI6ICJ1cHN0cmVhbSJ9LCAiaHR0cDovL3JhaWxzLXUzY3dnMm81MzZtaDYuZXUucGxhdGZvcm0uc2gvIjogeyJzc2kiOiB7ImVuYWJsZWQiOiBmYWxzZX0sICJvcmlnaW5hbF91cmwiOiAiaHR0cDovL3tkZWZhdWx0fS8iLCAidXBzdHJlYW0iOiAibXlydWJ5YXBwIiwgImNhY2hlIjogeyJkZWZhdWx0X3R0bCI6IDAsICJjb29raWVzIjogWyIqIl0sICJlbmFibGVkIjogdHJ1ZSwgImhlYWRlcnMiOiBbIkFjY2VwdCIsICJBY2NlcHQtTGFuZ3VhZ2UiXX0sICJ0eXBlIjogInVwc3RyZWFtIn19"
    ENV["PLATFORM_TREE_ID"]="2b2ba012b33a7b6f5b2cef5b42842bb04fa3cb65"
    ENV["PLATFORM_VARIABLES"]="eyJmb28iOiB7ImdydWJiIjogeyJ0d28iOiAyLCAib25lIjogMX0sICJiYXIiOiAiYmF6In19"
    ENV["PORT"]="/run/app.sock"
    ENV['RAILS_SERVE_STATIC_FILES'] = 'false'
    ENV['RAILS_LOG_TO_STDOUT'] = 'false'
    ENV['SECRET_KEY_BASE'] = "1234567890"
    @config = PlatformSH::config
  end

  after(:all) do
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

  it 'If env variables already set do not overide' do
    expect(ENV["RAILS_LOG_TO_STDOUT"]).to eq('false')
    expect(ENV["SECRET_KEY_BASE"]).to eq('1234567890')
  end
end
