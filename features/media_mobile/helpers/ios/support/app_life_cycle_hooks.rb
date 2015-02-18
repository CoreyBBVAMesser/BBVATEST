require 'calabash-cucumber/operations'
require 'fileutils'

INSTALLATION_STATE = {
  :installed => false
}

Before do |scenario|
  scenario_tags = scenario.source_tag_names

  if scenario_tags.include?('@reinstall')
    @calabash_launcher.reset_app_jail
    INSTALLATION_STATE[:installed] = true
  end
  unless @calabash_launcher.calabash_no_launch?
    @calabash_launcher.relaunch
    @calabash_launcher.calabash_notify(self)
  end

  @multiple = false
  @index = 0
  
  #take screenshot for every scenario 
  case scenario
    when Cucumber::Ast::Scenario, Cucumber::Ast::ScenarioOutline
      @multiple = false
      @scenario_title = scenario.feature.title
      @scenario_name = scenario.name.gsub(" ","_")

    when Cucumber::Ast::OutlineTable::ExampleRow
      @multiple = true
      @index = 0
      @scenario_title = scenario.scenario_outline.feature.title
      @scenario_name = scenario.scenario_outline.name.gsub(" ","_")

  end
    
  @image = "screenshots/ios/passed_scenarios/#{@scenario_title}/#{@scenario_name}/#{DateTime::now::strftime("%Y-%m-%d_%H-%M-%S")}/"
  @failed_image = "screenshots/ios/failed_scenarios/#{@scenario_title}/#{@scenario_name}/#{DateTime::now::strftime("%Y-%m-%d_%H-%M-%S")}.png"
  FileUtils.mkdir_p(@failed_image) unless File.directory?(@failed_image)


  start_test_server_in_background 

end

AfterStep('@screenshot') do |scenario|

end

#AfterStep do |scenario|
 # image = @image
  #if @multiple
   # image += "/Example_#{@index}/"
    #@index += 1
  #end

  #if(!image.nil?)
   # FileUtils.mkdir_p(image) unless File.directory?(image)
    #screenshot_embed({:prefix => Dir.pwd + "/" + "#{image}", :name=>Time::now::strftime("%Y-%m-%d_%H-%M-%S-%L.png").to_s})
  #end
#end

#After do |scenario|
 # if (scenario.failed?)
  #  failed_image = "screenshots/ios/failed_scenarios/#{scenario.feature.file}/#{scenario_name.gsub(" ","_")}"
   # FileUtils.mkdir_p(failed_image) unless File.directory?(failed_image)
    #screenshot_embed({:prefix => Dir.pwd + "/" + "#{failed_image}", :name=>Time::now::strftime("%Y-%m-%d_%H-%M-%S-%L.png").to_s})
  #end

  #shutdown_test_server
#end




