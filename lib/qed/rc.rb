require 'qed'
require 'qed/configure'

begin
  require 'rc/api'
  RC.profile_switch 'qed', '-p', '--profile'
  RC.configure 'qed' do |config|
    QED.configure(config.profile, &config)
  end
rescue LoadError
end

