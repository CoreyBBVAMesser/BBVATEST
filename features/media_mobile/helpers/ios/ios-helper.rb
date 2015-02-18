
require 'calabash-cucumber/operations'
include ::Calabash::Cucumber::Operations

module IosHelper
  
  PLATFORM = 'ios'

	def tap(selector)
    #touch(get_element_selector(selector))
		touch("#{selector[PLATFORM]}")
	end

	def _tap(selector)
		touch("#{selector[PLATFORM]}")
	end

	def tap_in_ui_component(selector,value)
		touch("#{selector[PLATFORM]} label marked:'#{value}'")
	end

  def tap_in_cell_row(selector, position, time=50)
    wait_for_elements_exist("#{selector[PLATFORM]} index:#{position.to_i}", :timeout=>time.to_i)
    # If no sleeping following touch fails
    sleep(1)
    touch("#{selector[PLATFORM]} index:#{position.to_i}")
  end

	def fill(selector,value)
		query(selector[PLATFORM], :setText=>value)
	end

  def predicate_contains(selector,value)
    query("#{selector[PLATFORM]} {text CONTAINS '#{value}'}")
  end

	def open_app
		true
	end

	def wait(selector, time=50)
		sleep(1)
		wait_for_elements_exist(["#{selector[PLATFORM]}"], :timeout=>time.to_i)
	end

	def wait_to_load(selector,text ,time=50)
		sleep(1)
		wait_for_elements_exist(["#{selector[PLATFORM]}'#{text}'" ], :timeout=>time.to_i)
	end

	def wait_screen_to_load(selector, text, time=50)
		sleep(1)
		wait_for_elements_exist(["#{selector[PLATFORM]} label marked:'#{text}'" ], :timeout=>time.to_i)
	end

	def wait_for_message(msg, time=20)
		sleep(1)
		wait_for_elements_exist("* text:'#{msg}'", :timeout=>time.to_i)
	end

  def wait_for_any_message(msgs, timeout=20)
    while timeout > 0
      for msg in msgs
        if element_exists("* text:'#{msg}'")
          return true
        end
      end
      sleep(1)
      timeout -= 1
    end
    fail("Timeout reached in wait_for_any_message")
  end

  def check_message(msg)
    elements_exists("* text:'#{msg}'")
  end

  def wait_for_cell_row(selector, position, time=50)
    sleep(1)
    wait_for_elements_exist(["#{selector[PLATFORM]} index:#{position.to_i}" ], :timeout=>time.to_i)
  end

	def wait_for_element_not_exist(selector, time=20)
		wait_for_elements_do_not_exist(["#{selector[PLATFORM]}"], :timeout=>time.to_i)
	end

	def check_element(selector)
		element_exists("#{selector[PLATFORM]}")
	end

  def check_element_with_value(selector,value)
    element_exists("#{selector[PLATFORM]} label marked:'#{value}'")
  end

  def checK_element_does_not_exist(selector)
    element_does_not_exist("#{selector[PLATFORM]}")
  end

  def check_element_like(selector,value)
    element_exists("#{selector[PLATFORM]} {text LIKE '#{value}'}")
  end

	def check_with_timeout(selector, timeout=10)
		while timeout > 0
      if element_exists("#{selector[PLATFORM]}")
        return true
      end
      sleep(1)
      timeout -= 1
    end
    return false
	end

	def who_i_am
		PLATFORM
	end

	def hover(selector)
  	end

	def fill_text(selector, value)
  end

  def scroll_down(selector)
     scroll("#{selector[PLATFORM]}",:down)
  end

  	def scroll_until_see_text(text)
	  	wait_poll(:until_exists => "label text:'#{text}'", :timeout => 20) do
	    	scroll("#{selector[PLATFORM]}", :down)
		end
	end

	def scroll_to_cell_number(selector, section)
	    scroll_to_cell(:row => 0, :section => section)
	    sleep(1)
	end

 	def scroll_to_row(row)
  		scroll_to_row "tableView", row
  		sleep(5)
 	end

	def swipe_right_screen(total_transactions, cell_position)
		#swipe("right", {:query => "#{table} index:#{times}"})
		#steps %Q{Then I swipe left}
	    # swipe_count = total_transactions - cell_position
	    
    swipe_count = total_transactions - cell_position
    swipe_count.times do
      swipe(:right)
      sleep(3)
    end
	end

	def swipe_left_screen(total_transactions, cell_position)
		# swipe_count = total_transactions - cell_position
	 #    swipe_count.times do
		# 	swipe(:left)
		# 	sleep(3)
		# 	puts "swipe left"
		# end

		swipe_count = cell_position - 1
		swipe_count.times do
			swipe(:left)
			sleep(3)
		end
	end

	def wait_time(time)
		sleep(time.to_i)
	end

	def picker_month(row)
		query("pickerView", [{:selectRow=>row.to_i},{:inComponent=>0},{:animated=>1}])
	end

	def picker_day(row)
		query("pickerView", [{:selectRow=>row.to_i},{:inComponent=>1},{:animated=>1}])
	end

	def picker_date(day, month)
		target_date = Date.parse("#{day}/#{month}/2014")
		current_time = date_time_from_picker()
		date_time = DateTime.new(target_date.year,
                         target_date.mon,
                         target_date.day,
                         current_time.hour,
                         current_time.min,
                         0,
                         Time.now.sec,
                         current_time.offset)

		picker_set_date_time date_time
			
	end

	def get_cells_date
		days_array = []
		months_array = []
		each_cell(:animate => false, :post_scroll => 0.1) do |row, sec|
			days_array << query("tableViewCell indexPath:#{row},#{sec} label", :text).first.to_i
			current_month = query("tableViewCell indexPath:#{row},#{sec} label", :text)[1]
			months_array << Date::ABBR_MONTHNAMES.index(current_month) 
		end
		
	  return days_array, months_array
	end

	def count_cells
	  query("tableViewCell").count
	  count = each_cell(:post_scroll=>0) do |row, sec|
	    @count = row
	  end
	  return @count
	end

	def select_cell(position, time=50)
    wait_for_elements_exist("tableViewCell index:#{position}", :timeout=>time.to_i)
		touch("tableViewCell index:#{position}")
	end

	def get_cells_amount(value)
		if(value == "EN")
			num = 1
		elsif value == "ES"
			num = 2
		end
		@amount_array = []
		each_cell(:animate => false, :post_scroll => 0.1) do |row, sec|
			current_amount = query("tableViewCell indexPath:#{row},#{sec} label", :text)[4].to_s
			current_amount = current_amount.tr('$','')
			case num
			when 1
				current_amount.gsub!(',','')
			when 2
				current_amount.gsub!('.','')
			end				
				
			current_amount = current_amount.to_f
			@amount_array << current_amount
		end
		return @amount_array
	end

  def get_cells_text()
    @text_array = []
    each_cell(:animate => false, :post_scroll => 0.1) do |row, sec|
      @text_array << query("tableViewCell indexPath:#{row},#{sec} label", :text)[2].to_s
    end
    return @text_array
  end

  def check_value_text(selector)
    query(selector).first["text"]
  end

  def keyboard_enter_text_value(text)
     keyboard_enter_text("#{text}")
  end

  def keyboard_dismiss
    keyboard_enter_char("Dismiss")
  end

  def switch_is_checked_on(selector)
    query("#{selector[PLATFORM]}",:isOn)[0].to_i
  end

  def switch_status(selector, status)
      if status #on true
          if switch_is_checked_on(selector) == 0
            tap(selector)
          end
      else
          if switch_is_checked_on(selector) == 1
            tap(selector)
          end
      end
    end

  def get_random_number_with_digits(digits)
    valuetxt = ""
    for i in 0...digits.to_i
      valuetxt << Random.new.rand(0...9).to_s
    end
    return valuetxt
  end

end