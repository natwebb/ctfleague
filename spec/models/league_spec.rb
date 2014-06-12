describe League do
  it { should belong_to :user }
  it { should belong_to :commissioner }
  it { should have_many :teams }
  it { should have_many :seasons }
  it { should validate_presence_of :user }
  it { should validate_uniqueness_of :name }
end
