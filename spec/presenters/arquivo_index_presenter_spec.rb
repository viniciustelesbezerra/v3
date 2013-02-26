require 'spec_helper'

describe Arquivos::IndexPresenter do
  let!(:presenter) { Arquivos::IndexPresenter.new({ search: "" }) } 

  it "should respond to :report_arquivos" do
    presenter.respond_to?(:report_arquivos).should be_true
  end
  
  it "should_not raise error" do
    expect { presenter.report_arquivos }.to_not raise_error
  end

end