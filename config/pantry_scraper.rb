class PantryScraper < Kimurai::Base

        @@base_url = "https://www.foodpantries.org/ci/ny-new_york"
        @name= "pantries"
        @start_urls = ["https://www.foodpantries.org/ci/ny-new_york"]
        @engine = :selenium_chrome

        def parse(response, url:, data: {})
        binding.pry
            doc = browser.current_response
            $scraped_pantries.flatten << doc.css("ul li")
            
        end

end