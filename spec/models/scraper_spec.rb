require 'spec_helper'


describe Scraper do
  it "takes a url as a param on initialize" do
    s = Scraper.new("http://www.stuff.com")
    expect(s.url).to eq("http://www.stuff.com")
  end
  it "raises an error without a url" do
    expect { Scraper.new }.to raise_error(ArgumentError)
  end
  it "has a function get_hrefs" do
    s = Scraper.new("http://www.stuff.com")
    expect(s.get_hrefs).to be
  end
  it "returns an array of links on a page " do
    s = Scraper.new("http://jonl.org/")
    s.get_hrefs
    expect(s.hrefs.size).to eq(8)
    expect(s.hrefs[0]).to eq("Hi/Happier/Happier.html")
  end
  it "has a function get_images" do
    s = Scraper.new("http://jonl.org/")
    expect(s.get_images).to be
  end
  it "returns an array of images" do
    s = Scraper.new("http://asiahoe.com/")
    s.get_images
    expect(s.images.size).to eq(6)
    expect(s.images[0]).to eq("http://asiahoe.com/wp/wp-content/uploads/2013/09/logo.gif")
  end
end
