module Status_Checker
  require 'net/http'
  class Status_Checker
    
    def self.request(uri)
      http = URI(uri)
      http.port = Net::HTTP.https_default_port()
      
      return Net::HTTP.get_response(http)
    end
    
    def self.get_status(uri)
      
      completion_times = []
      
      6.times do
        start = Time.now
        
        response = request(uri)
        
        completion_times << (Time.now - start) * 1000
        
        p "Request to #{response.uri} responded with '#{response.code} #{response.message}' and took #{completion_times[-1]} ms"
      
        sleep 10      
      end
      
      average = completion_times.inject{ |sum, el| sum + el }.to_f / completion_times.size
      
      puts "The average request time was: #{average} ms"
    end
  end
end

Status_Checker::Status_Checker.get_status("https://gitlab.com")