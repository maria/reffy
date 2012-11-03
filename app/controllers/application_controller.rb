class ApplicationController < ActionController::Base
  protect_from_forgery
 
private

  def mobile_user_agent?
    uag         = request.env["HTTP_USER_AGENT"].downcase rescue ""
    is_mobile   = false

    if uag.index("android") || uag.index("htc") || uag.index("iphone")
      is_mobile = true
    end

    @mobile_user_agent ||= ( request.env["HTTP_USER_AGENT"] && is_mobile )
  end

end
