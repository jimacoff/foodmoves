require File.dirname(__FILE__) + '/../../test_helper'

class Gateway < Test::Unit::TestCase
 def test_should_detect_if_a_card_is_supported
    Gateway.supported_cardtypes = [:visa, :bogus]
    assert [:visa, :bogus].all? { |supported_cardtype| Gateway.supports?(supported_cardtype) }
    
    Gateway.supported_cardtypes = []
    assert_false [:visa, :bogus].all? { |invalid_cardtype| Gateway.supports?(invalid_cardtype) }
  end
  
  def test_should_gateway_uses_ssl_strict_checking_by_default
    assert Gateway.ssl_strict
  end
  
  def test_should_be_able_to_look_for_test_mode
    Base.gateway_mode = :test
    assert Gateway.new.test?
    
    Base.gateway_mode = :production
    assert_false Gateway.new.test?
  end
  
end