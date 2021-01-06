class PantryScraper < Kimurai::Base

        @@base_url = "https://www1.nyc.gov/site/acs/about/resourcesforfamilies.page"
        @name= "pantries"
        @start_urls = ["https://www1.nyc.gov/site/acs/about/resourcesforfamilies.page"]
        @engine = :selenium_chrome

        def parse(response, url:, data: {})
        binding.pry
            doc = browser.current_response
            $scraped_pantries.flatten << doc.css("ul li")
            
        end

end