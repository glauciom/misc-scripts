require 'net/http'
require 'combine_pdf'

def read_urls()
	pdf_check = CombinePDF.new
	ini = 475 # due to the website’s rejection system, this is to continue the processing from where it was stopped.
	(490-ini).times { |i|
    		page = i+1+ini
    		filename = "#{page}.pdf"
    		File.open(filename, 'w') { |file|
     			file.write(Net::HTTP.get(URI.parse("https://babel.hathitrust.org/cgi/imgsrv/download/pdf?id=mdp.39015004514728;orient=0;size=100;seq=#{page};attachment=0")))
    		}
    		print "#{page}…"
    		sleep 60 # the web site doesn’t allow too many request at once
    		pdf_check << CombinePDF.load(filename) # here just to check pdf’s valid.
  	}
end

def save()
	pdf = CombinePDF.new
	491.times { |page|
		filename = "#{page}.pdf"
		pdf << CombinePDF.load(filename)
	}
	puts "Saving all PDF’s into just one"
	pdf.save "Smoothing, Forecasting and Prediction of Discrete Time Series_GM.pdf"
	puts "done!"
end

#read_urls()
save()

