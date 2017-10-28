require 'rails_helper'

RSpec.describe IngredientsPost, type: :model do
  it { should belong_to(:ingredient) }
  it { should belong_to(:post) }
end
