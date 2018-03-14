require 'rails_helper'

RSpec.describe User, type: :model do
  #Association test
  #ensure User model has a 1:m relationship w/ the Order model
  it {should have_many(:orders)}

  #Validation test
  #ensure that name, email and password are present before save
  it {should valide_presence_of(:name)}
  it {should valide_presence_of(:email)}
  it {should valide_presence_of(:password_digest)}

end
