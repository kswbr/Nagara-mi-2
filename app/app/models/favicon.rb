class Favicon < ApplicationRecord
  belongs_to :site

  def self.getSiteFavicon(url)
    begin
      domain = URI(url).host
      favicon = Net::HTTP.get(URI.parse("http://www.google.com/s2/favicons?domain=#{domain}"))
    rescue
      favicon = nil
    end
    {:binary => favicon,:content_type => "image/png"}
  end

end
