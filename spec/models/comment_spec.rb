RSpec.describe Comment, type: :model do
  it { is_expected.to have_db_column :body }
end
