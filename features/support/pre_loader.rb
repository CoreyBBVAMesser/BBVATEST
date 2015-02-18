require "erb"

module PreLoader
  attr_accessor :browser

  unless defined? @@env_config
    puts "loading environments.yaml..."
    @@base_url = (ENV['URL'] && ENV['URL'].to_sym || '')
    @@env = (ENV['ENV'] && ENV['ENV'].to_sym) || :sys2
    environments = YAML.load(File.open('config/environments.yaml'))
    @@env_config = environments[@@env.to_s]
   
    if ENV['PLATFORM'] == 'ios'
      require 'calabash-cucumber/cucumber'
      require 'calabash-cucumber/calabash_steps'
    elsif ENV['PLATFORM'] == 'android'
      require 'calabash-android/cucumber'
      require 'calabash-android/calabash_steps'
    end

    raise "No config found for environment: #{@@env}" unless @@env_config
  end

  def env
    @@env
  end

  def env_config
    @@env_config
  end

  def base_url
    @@base_url
  end

  def env_language
    @@env_lang
  end
end