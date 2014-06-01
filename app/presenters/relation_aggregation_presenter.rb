class RelationAggregationPresenter
  attr_accessor :relation

  def initialize(relation)
    @relation = relation
  end

  def records_by_group(attribute)
    values = relation.map { |s| s.send(attribute) }.uniq

    Hash.new.tap do |h|
      values.each do |v|
        count = relation.select { |r| r.send(attribute) == v }.count
        h.merge!( v.to_s => count )
      end
    end
  end
end