class ScraperController < ApplicationController
  def index
  end
  def hrefs
   @scraper = Scraper.new("http://www.nytimes.com/")
   @scraper.get_hrefs
   respond_to do |format|
    format.json { render :json => @scraper.hrefs }
   end
  end
  def images
    @scraper = Scraper.new("http://www.nytimes.com/")
    @scraper.get_images
    respond_to do |format|
      format.json { render :json => @scraper.images }
    end
  end
end