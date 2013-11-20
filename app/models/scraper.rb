class Scraper
  attr_accessor :url, :hrefs, :images
  def initialize(url)
    @url = url
  end
  def get_hrefs
    response = HTTParty.get(@url)
    doc = Nokogiri::HTML(response)
    @hrefs = []
    doc.css('a').each do |a|
      @hrefs << a.get_attribute('href')
    end
  end
  def get_images
    response = HTTParty.get(@url)
    doc = Nokogiri::HTML(response)
    # @images = []
    # doc.css('img').each do |img|
    #   src = img.get_attribute('src').gsub(/"/, "'")
    #   @images << src
    # end
    @images = doc.css('img').map{ |i| i['src'] }
  end
end
