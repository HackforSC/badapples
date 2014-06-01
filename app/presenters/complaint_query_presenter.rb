class ComplaintQueryPresenter
  attr_accessor :relation

  def initialize(relation)
    @relation = relation
  end

  def issue_types
    relation.map {|a| a.issue }.uniq
  end

  def num_high_severity
    relation.select { |x| x.high_severity? }.count
  end

  def num_medium_severity
    relation.select { |x| x.medium_severity? }.count
  end

  def num_low_severity
    relation.select { |x| x.low_severity? }.count
  end

  def num_other_severity
    relation.select { |x| x.other_severity? }.count
  end
end