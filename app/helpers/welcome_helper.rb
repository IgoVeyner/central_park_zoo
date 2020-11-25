module WelcomeHelper
  def on_welcome_page
    '/' == request.env['PATH_INFO']
  end
end
