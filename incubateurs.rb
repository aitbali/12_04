require 'rubygems'
require 'nokogiri' 
require 'open-uri'       

=begin
        page = Nokogiri::HTML(open("http://www.alloweb.org/annuaire-startups/annuaire-incubateurs-startups/"))
def get_the_email(url)
        page = Nokogiri::HTML(open("#{url}"))
        links = page.css("body/div[1]/div[3]/div/div/div[2]/div[1]/div/div/div/div[1]/div/div[1]/div/div/div/div/div/p[5]/a[1]")
        ko = links['href']
        puts ko
end
=end



n=1

net= page.css('h2.listing-row-title/a')
net.each {|url| net2=url['href']
name=page.css("body/div[1]/div/div/div/div[2]/div[1]/div/div[3]/div[#{n}]/div/div[2]/h2/a")

puts name.text
puts net2
n+=1

get_the_email(net2)
}

        
        
      

       