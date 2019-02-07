require 'savon'
class CalculatorWS
  def initialize(wsdl)
    @client = Savon.client(wsdl: "#{wsdl}")
  end

  def get_actions
    puts "Available operations..."
    puts @client.wsdl.soap_actions
  end

  def add_request(int_1, int_2)
    begin
      @response_add = @client.call(:add, message: {intA: int_1, intB: int_2})
      puts @response_add.to_hash
    rescue
      puts "PASS- SOAP Returned expected error in response"
    end
  end

  def multiply_request(int_1, int_2)
    @response_mul = @client.call(:multiply, message: {intA: int_1, intB: int_2})
    puts @response_mul.to_hash
  end

  def verify_response_add
    (@response_add.to_hash.key?(:add_response)) ? (puts "PASS") : (raise "Failed - Expected node is not found")
  end

  def verify_response_multiplication
    (@response_mul.to_hash.key?(:multiply_response)) ? (puts "PASS") : (raise "Failed - Expected node is not found")
  end
end