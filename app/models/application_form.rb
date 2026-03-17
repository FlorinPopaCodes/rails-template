class ApplicationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  def save
    return false unless valid?
    ApplicationRecord.transaction { submit! }
    true
  end

  private

  def submit!
    raise NotImplementedError
  end
end
