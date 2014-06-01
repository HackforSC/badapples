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

  def records_by_state
    states = relation.map { |s| s.state }.uniq

    Hash.new.tap do |h|
      states.each do |state|
        count = relation.select { |r| r.state == state }.count
        h.merge!( state.to_s => count )
      end
    end
  end
end