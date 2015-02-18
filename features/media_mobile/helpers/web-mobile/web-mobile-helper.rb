require 'watir-webdriver'

module WebMobileHelper

  PLATFORM='web_mobile'
  TYPE = 'type'
  EXPRESSION = 'expression'



  def open_app
    $browser.goto  PreLoader.env_config['login']
  end

  def get_element(selector)
    return eval("$browser.#{selector[PLATFORM][TYPE]}(#{selector[PLATFORM][EXPRESSION]})")
  end

  def get_element_in_array(selector, index)
    return eval("$browser.#{selector[PLATFORM][index][TYPE]}(#{selector[PLATFORM][index][EXPRESSION]})")
  end

  def tap(selector)
    get_element(selector).click
  end

  def fill(selector, value)
    get_element(selector).send_keys value
  end

  def fill_text(selector, value)
    get_element(selector).set value
  end

  def wait(selector, time=20)
    Watir::Wait.until(time.to_i) { get_element(selector).exists? }
  end

  def check_element(selector)
    get_element(selector).exist?
  end

  def wait_for_message(selector, msg)
    get_text_element(selector).should == msg
  end

  def get_text_element(selector)
    get_element(selector).text
  end

  def who_i_am
    PLATFORM
  end

  def tap_element(element)
      element.click
  end

  def tap_radio(element)
    element.label.click
  end

  def get_account(selector, account)
    elem_found = nil?
    get_element(selector).each_with_index do |elem, index|
      if elem.text.include? account.to_s
        elem_found = elem
      end
    end
    return elem_found
  end

  def get_account_value(selector, account)
    elem_found = "";
    element = get_account(selector, account)
    eval("element.#{selector[PLATFORM]["subtype"]}(#{selector[PLATFORM]["subexpression"]})").each_with_index do |elem, index|
      if index == 0
        elem_found = elem.text.gsub(/[^\d\.]/, '').to_f
      end
    end
    return elem_found
  end

  def check_with_timeout(selector, timeout=10)
    while timeout > 0
      if get_element(selector).exist?
        return true
      end
      sleep(1)
      timeout -= 1
    end
    return false
  end

  def switch_is_checked_on(selector)
    get_element_in_array(selector,0).checked?
  end

  def tap_in_checkbox(selector)
    get_element_in_array(selector,1).click
  end

  def switch_status(selector, status)
    if status #on true
        if switch_is_checked_on(selector) == false
          tap_in_checkbox(selector)
        end
    else
        if switch_is_checked_on(selector) == true
          tap_in_checkbox(selector)
        end
    end
  end

end