require 'rubygems'
require 'nokogiri' 
require 'open-uri'


loop do
    def court_Cryptos
        page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
        
        n=1
        total_cryptos = page.search("tbody/tr").size
        
        while n < total_cryptos
            name = page.css("tbody/tr[#{n}]/td[2]/a")
            price = page.css("tbody/tr[#{n}]/td[5]")
            x="#{price.text}".split("\n")  
            hash = { :Nom => "#{name.text}",
            :Prix => "#{x[1]}"
            }
            puts hash
            n+=1
        end
    end

    court_Cryptos

    sleep(3600)                 #recharge la liste toutes les heures
end