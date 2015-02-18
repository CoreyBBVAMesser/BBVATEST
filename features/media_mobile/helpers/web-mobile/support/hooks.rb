require 'watir-webdriver'
include Selenium

# Hook that happens before each scenario
Before do |scenario|

  if ENV['OS'].nil? or ENV['OS'].eql? 'android'
    @driver = Selenium::WebDriver.for(:remote, :desired_capabilities => :android)
    @timeoutImplicitWait = 10
  elsif ENV['OS'].eql? 'blackberry'
    @url = ENV['URL']
    @driver = Selenium::WebDriver.for(:remote, :url => @url, :desired_capabilities => {})
    @timeoutImplicitWait = 3
  end

  browser = Watir::Browser.new @driver

	#Configuración del browser
	browser.driver.manage.timeouts.implicit_wait = @timeoutImplicitWait
	#browser.window.resize_to(420, 640)
	#browser.driver.manage.window.maximize

	$browser = browser

  case scenario
    when Cucumber::Ast::Scenario, Cucumber::Ast::ScenarioOutline
      @feature_title = scenario.feature.title
      @feature_name = scenario.feature.name
      @scenario_name = scenario.name
      @scenario_tags = scenario.source_tag_names
      index= 1
      @scenario_title= scenario.to_s + ' ' + index.to_s
    when Cucumber::Ast::OutlineTable::ExampleRow
      @scenario_title= scenario.to_s + ' ' + index.to_s
      @feature_title = scenario.scenario_outline.feature.title
      @feature_name = scenario.scenario_outline.feature.name
      @scenario_name = scenario.scenario_outline.name
      @scenario_tags = scenario.scenario_outline.source_tag_names
      index= scenario.map.entries[0].value
      @scenario_title= scenario.to_s + ' ' + index.to_s
  end
  @result_directory = "#{Dir.pwd.to_s}/test-reports/screenshots/#{@feature_title}/#{@scenario_name.gsub(" ","_")}/#{index.to_s}/"
  @images_directory = "screenshots/#{@feature_title}/#{@scenario_name.gsub(" ","_")}/#{index.to_s}/"

  unless File.directory?(@result_directory)
    FileUtils.mkdir_p(@result_directory)
  end


end

AfterStep do |scenario|
  #name = Time::now::strftime("%Y%m%d-%H%M%S.%L.png").to_s
  #path = @result_directory + name
  #embed_path= @images_directory + name
  #$browser.screenshot.save path
  #@__cucumber_runtime.embed("#{embed_path}", "image/png", name)
end

# Hook to disconect from the app after each scenario
After do |scenario|
	$browser.close
end

# Close the browser after the last test
at_exit do
  $browser.close unless $browser.nil?
end
