class AlertsDetailScreen < MediaMobile

  CLOSE_VIEW = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "UIBarButtonItemCustomButton",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

  TABLE_CELL_ALERTS = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "AlertAccountCell",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

  WITHDRAWAL = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "LowerAndUpperThresholdAlertInputView",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

  FRAUD = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "ListAlertInputView",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }
  BALANCE = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "AlertInputGroupView",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

   DEPOSITS = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "AlertInputGroupView index:2",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

  OTHER = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "AlertInputGroupView index:4",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }
  SWITCH_ONE = {
     "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "UISwitch index:0",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}} 
  }

  SWITCH_TWO = {
     "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "UISwitch index:1",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}} 
  }
  SWITCH_THREE = {
     "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "UISwitch index:2",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}} 
  }

  INPUT_FIRST  = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "Txtf02 index:0",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }
  INPUT_SECOND  = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "Txtf02 index:1",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

  INPUT_THIRD  = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "Txtf02 index:2",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

  BUTTON_OK_KEYBOARD  = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "UIButton label marked:'OK'",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

  BUTTON_SEND  = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "UIButton label marked:'Submit'",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

  SCROLL_VIEW = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "*",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

  DROP_LIST_FIRST = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "Drp01 index:0",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

  DROP_LIST_SECOND = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "Drp01 index:1",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }


  DROP_CONTENT_LIST  = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "UIPickerTableView ",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

  VALUE_EXIST = {
      "android" => "com.bbva.compassBuzz.commons.widget.CustomTextView id:'leftTextView' text:'Deposit'",
      "ios" => "* ",
      "web_mobile" => { "type" => "a", "expression" => {:css => ".container > section > a"}}
  }

 def data_change_message
   
 end
 
   
  def wait_for_alert_detail_screen(type)
    wait(BALANCE) if type == "balance"
    wait(FRAUD)    if type == "fraud"
    wait(WITHDRAWAL) if type == "withdrawal"
    wait(DEPOSITS) if type == "deposits"
    wait(OTHER) if type == "other"
  end

  def tap_over_type(type)
    tap(BALANCE) if type == "balance"
    tap(FRAUD)    if type == "fraud"
    tap(WITHDRAWAL) if type == "withdrawal"
    tap(DEPOSITS) if type == "deposits"
    tap(OTHER) if type == "other"
  end

  def wait_for_input_field
    wait(INPUT_FIRST)
    wait(INPUT_SECOND)
  end

  def wait_for_input_field_withdrawal_first
    wait(INPUT_FIRST)
  end

  def fill_text_inputs_advance(max)
    fill(INPUT_FIRST,max)
  end

  def fill_text_inputs_check(max)
    fill(INPUT_SECOND,max)
  end

  def fill_text_one_inputs(max)
    fill(INPUT_FIRST,min)
    fill(INPUT_SECOND, max)
  end

  def fill_text_two_inputs(min, max)
    fill(INPUT_FIRST,min)
    fill(INPUT_SECOND,max)
  end

  def fill_text_two_inputs_withdrawal(min, max)
    fill(INPUT_SECOND,min)
    fill(INPUT_THIRD, max)
  end

  def fill_text_one_inputs_withdrawal(max)
    fill(INPUT_FIRST,max)
  end

  def fill_text_three_inputs(min, max1, max2)
    fill(INPUT_FIRST,min)
    fill(INPUT_SECOND, max)
    fill(INPUT_THIRD, max)
  end
  
  def scroll_view
    scroll_down(SCROLL_VIEW)
  end

  def wait_switch(value)
    case value
    when 0
       wait(SWITCH_ONE)
    when 1
      wait(SWITCH_TWO)
    when 2
      wait(SWITCH_THREE)
    end
  end

  def switch_status_alerts(value)
    case value
    when 0
       if switch_is_checked_on(SWITCH_ONE) == 0
         tap(SWITCH_ONE)
      end
    when 1
      if switch_is_checked_on(SWITCH_TWO) == 0
         tap(SWITCH_TWO)
      end
    when 2
      if switch_is_checked_on(SWITCH_THREE) == 0
         tap(SWITCH_THREE)
      end
    end
     
  end

  def switch_status_alerts_for_fraud(value)
     tap(SWITCH_ONE)
  end

  def submit_button
    wait(BUTTON_SEND)
    tap(BUTTON_SEND)
  end

  def checking_elements_existence_first(value)
      check_element_like(INPUT_FIRST,value)
  end

  def checking_elements_existence_second(value)
    check_element_like(INPUT_SECOND,value)
  end

  def checking_elements_existence_third(value)
    check_element_like(INPUT_THIRD,value)
  end

  def open_drop_down_list_index(index)
    puts "drop down list"
    case index
    when 1
       wait(DROP_LIST_FIRST)
       touch(DROP_LIST_FIRST)
    when 2
       wait(DROP_LIST_SECOND)
       touch(DROP_LIST_SECOND)
    end
  end

def select_element_drop_down_list_index(index,text)
    puts "drop down list"
    case index
    when 1
       wait(DROP_CONTENT_LIST)
       tap_in_ui_component(DROP_CONTENT_LIST,text)
       
    when 2
       wait(DROP_CONTENT_LIST)
       tap_in_ui_component(DROP_CONTENT_LIST,text)
    end
 end


  def tap_ok_button_keyboard
    tap(BUTTON_OK_KEYBOARD)
  end

 def get_random_number
   text = get_random_number_with_digits(4)
 end

 def check_value_input(input)
   check_element_with_value(VALUE_EXIST,input)
 end

end