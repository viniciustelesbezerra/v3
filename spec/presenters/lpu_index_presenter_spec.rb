require 'spec_helper'

describe Lpus::IndexPresenter do
  let!(:presenter) { Lpus::IndexPresenter.new({ search: "" }) } 

  it "should respond to :report_lpus" do
    presenter.respond_to?(:report_lpus).should be_true
  end
  
  it "should_not raise error" do
    expect { presenter.report_lpus }.to_not raise_error
  end

end