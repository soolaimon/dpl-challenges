class PagesController < SiteController
  
  def show
    @page = Page.find_by_permalink(params[:permalink])
    if @page.nil?
      redirect_to missing_page_path
    end  
  end
  
  def missing
    render File.join(Rails.root, 'public', '404.html')
  end
  
end
