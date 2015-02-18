class MediaMobile
	def initialize
		
		if ENV['PLATFORM'].nil? or ENV['PLATFORM'].include? 'web_mobile'
			lib = "WebMobile"
			require_relative 'helpers/web-mobile/web-mobile-helper'
		elsif ENV['PLATFORM'].include? 'ios' or ENV['PLATFORM'].include? 'ios_device'
			lib = "Ios"
			require_relative 'helpers/ios/ios-helper'
		elsif ENV['PLATFORM'].include? 'android'
			lib = "Android"
			require_relative 'helpers/android/android-helper'
		end
		eval("extend #{lib}Helper")
	end

	def method_missing(method, *args)
		if method.to_s.include? 'is_'
			method_class = method.to_s.split('_')[1].tr('?','')
			method_class.eql? self.who_i_am
		end
	end

	def is_native?
		return is_ios? || is_android?
	end

	def is_ios?
		return who_i_am.include? "ios"
	end

	def is_android?
		return who_i_am.include? "android"
	end

	def is_web_mobile?
		return who_i_am.eql? "web_mobile"
	end

end