require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require'pry'

def get_the_email_of_a_townhal_from_its_webpage(url_townhall)
	url_townhall = Nokogiri::HTML(open(url_townhall))

	puts url_townhall.css("title").text
	email = url_townhall.css("p.Style22")[11].text
	puts "email : " + email

end

def get_all_the_urls_of_val_doise_townhalls
page = Nokogiri::HTML(open("https://annuaire-des-mairies.com/val-d-oise.html"))   
puts page.class
puts page.css('title')
links = page.css("a.lientxt")
villes = page.css("a.lientxt").text


table = links.map { |link| link['href'][1..100] }

	table.each do |town_link|
		
		new_page = Nokogiri::HTML(open("https://annuaire-des-mairies.com" + town_link))  
		puts new_page.css('title')
		puts new_page.css("p.Style22")[11].text
	end
end

get_all_the_urls_of_val_doise_townhalls