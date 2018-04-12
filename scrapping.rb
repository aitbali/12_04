require 'rubygems'
require 'nokogiri' 
require 'open-uri'       

def get_the_email_of_a_townhal_from_its_webpage(ville_url)
        page = Nokogiri::HTML(open("#{ville_url}"))
        links = page.css("td:contains('@')")
        name = page.css("h1:contains('95')")
        tel = page.css("div/main/section[2]/div/table/tbody/tr[2]/td[2]")   
        hash={ :Ville => "#{name.text}",
            :Telephone => "#{tel.text}",
            :lien => "#{links.text}"}
        puts hash

end
        

def get_all_the_urls_of_val_doise_townhalls
        page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
        href="http://annuaire-des-mairies.com"  
        links = page.css("a.lientxt")

        links.each {    |link|
        url=link['href']
        root_href = URI.join(href,url).to_s
        
        get_the_email_of_a_townhal_from_its_webpage(root_href)
        }
end

get_all_the_urls_of_val_doise_townhalls






