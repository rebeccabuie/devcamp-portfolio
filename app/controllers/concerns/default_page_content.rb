module DefaultPageContent
  extend ActiveSupport::Concern

  include do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "DevCamp Portfolio | My portfolio Website"
    @seo_keywords = "Rebecca Buie Portfolio"
  end 
end