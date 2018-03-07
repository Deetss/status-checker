module StatusChecker
  require 'net/http'
  class Request
    
    attr_reader :uri
    
    def initialize(uri)
      @uri = URI(uri)
      @uri.port = Net::HTTP.https_default_port()
    end
    
    def get_response
      return Net::HTTP.get_response(@uri)
    end
  end
  
  class StatusChecker
    def self.get_status(uri)
      completion_times = []
      
      target = Request.new(uri)
      
      puts "Status checker will send requests to #{target.uri} for 1 minute every 10 seconds."
      
      6.times do |i|
        
        start = Time.now
        
        response = target.get_response
        
        completion_times << (Time.now - start) * 1000
        
        puts "Request to #{response.uri} responded with '#{response.code} #{response.message}' and took #{completion_times[-1]} ms"
        
        sleep 10 unless i == 5
      end
      
      average = completion_times.inject{ |sum, el| sum + el }.to_f / completion_times.size
      
      puts "The average request time was: #{average} ms"
    end
  end
end