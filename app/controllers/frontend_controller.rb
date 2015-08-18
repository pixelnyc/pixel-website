module Frontend; end
class FrontendController < ActionController::Base
  layout 'frontend'
  before_action :fetch_settings
  helper FrontendHelper


  def full_url(url)
    #[RailsOpro.application.config.asset_host, url].join
  end
  helper_method :full_url

  protected

  def fetch_settings
    @settings = SiteSetting.all.map { |s| [s.code.to_sym, s.value]}.to_h
  end
end