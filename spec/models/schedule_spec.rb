require 'rails_helper'

describe Schedule do
  it "有効なファクトリを持つこと" do
    expect(build(:schedule)).to be_valid
  end
end
