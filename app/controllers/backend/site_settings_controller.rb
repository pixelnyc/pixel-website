class Backend::SiteSettingsController < BackendController

  def index
    @site_settings = SiteSetting.order('id asc')
  end

  def update
    keys = site_settings_params.map {|k, _| k}
    vals = site_settings_params.map {|_, v| v}
    @site_settings = SiteSetting.update(keys, vals)
    if @site_settings.all? { |setting| setting.valid? }
      redirect_to backend_site_settings_path, notice: 'Settings were successfully updated'
    else
      flash.now[:alert] = 'Check out the error below'
      render 'index'
    end
  end

  private
  def site_settings_params
    params.require(:site_settings).permit!
  end
end