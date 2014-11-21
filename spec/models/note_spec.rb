require "spec_helper"

describe Note do

    describe "Constrains validations" do
        it { should validate_presence_of :body }
    end

    describe "Relational mapping" do
        it { should belong_to :project }
    end

end