class ApplicationQuery
  class << self
    delegate :call, to: :new
  end

  def initialize(relation = default_relation)
    @relation = relation
  end

  def call
    raise NotImplementedError
  end

  private

  attr_reader :relation

  def default_relation
    raise NotImplementedError
  end
end
