describe Team do
  it { should belong_to :league }
  it { should validate_uniqueness_of :name }
end
