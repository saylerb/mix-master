require 'rails_helper'

RSpec.describe Artist, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "validations" do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:image_path) }
    it { should validate_uniqueness_of(:name) }
  end

end
