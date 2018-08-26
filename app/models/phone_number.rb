class PhoneNumber < ApplicationRecord
    def generate_pin
        self.pin = rand(0000..9999).to_s.rjust(4, "0")
        save
    end 
    def send_pin
        client = ZenSend::Client.new(ENV['API_SMS'])
        sms_response = client.send_sms(
          originator: ENV['TEST_NUM'],  
          numbers: ["447777777777", "448888888888"],
          body: "Your PIN is ..."
          )
    end 
end
