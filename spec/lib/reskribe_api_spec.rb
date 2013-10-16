require 'spec_helper'

describe ReskribeApi do

  ReskribeApi.api_token = "75ez43hff2ggazi7m057xar4wtect0yguvfselpmp4-a9hiay6cpsoqrpiwlcejlww"
  ReskribeApi.ssl = false
  ReskribeApi.api_base = "api.rskr1.com/v1"

  context "when Form is created" do
  	it "result should be not null" do
	  result = ReskribeApi::Form.create("testplan2", "new_uid1")

	  result[:url].should_not be_nil
	  result[:security_token].should_not be_nil
	end
  end


end